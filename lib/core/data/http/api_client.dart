import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pretty_dio_logger/flutter_pretty_dio_logger.dart';
import 'package:gtaf_assignment/core/data/http/resource.dart';
import 'package:logger/logger.dart';


import '../../../route/navigation_service.dart';
import '../../domain/error/api_exceptions.dart';
import '../cache/base_cache.dart';
import '../cache/shared_preference_constants.dart';
import 'api_client_config.dart';
import 'api_urls.dart';


Dio _dio = Dio();

class ApiClient {
  final ApiClientConfig _config;
  var logger;
  final BaseCache _cache;
  Future? _ongoingRefreshCall;
  bool isRefresh = false;

  ApiClient(this._config, this._cache, this.logger);

  ApiClientConfig get config => _config;

  // void removeToken() {
  //   _cache.flushAll().then((value) {
  //     NavigationService.logoutAndNavigateToLoginScreen();
  //   });
  // }

  Future<Resource> get(String uri, {Map<String, dynamic>? queryParams}) async {
    return _get(uri, false, queryParams);
  }

  Future<Resource> authorizedGet(String uri,
      {Map<String, dynamic>? queryParams}) async {
    return _handleAuthorizationError(() {
      return _get(uri, true, queryParams);
    });
  }

  Future<Resource> post(String uri, Map<String, dynamic> data) async {
    return _post(uri, false, data);
  }

  Future<Resource> authorizedPost(String uri, Map<String, dynamic> data) async {
    return _handleAuthorizationError(() {
      return _post(uri, true, data);
    });
  }

  Future<Resource> authorizedPut(String uri, Map<String, dynamic> data) async {
    return _handleAuthorizationError(() {
      return _getDataOrHandleDioError(() async {
        Options options = await _makeOptions(true);
        return _dio.put(
          _makeUrl(uri),
          data: data,
          options: options,
        );
      });
    });
  }

  Future<Resource> delete(String uri) async {
    return _getDataOrHandleDioError(() async {
      Options options = await _makeOptions(false);
      return _dio.delete(
        _makeUrl(uri),
        options: options,
      );
    });
  }

  Future<Resource> _get(
      String uri, bool tokenize, Map<String, dynamic>? queryParams) async {
    return _getDataOrHandleDioError(() async {
      Options options = await _makeOptions(tokenize);
      _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
      ));
      String url = _makeUrl(uri);
      return _dio.get(
        url,
        queryParameters: queryParams,
        options: options,
      );
    });
  }

  Future<Resource> _post(
      String uri, bool tokenize, Map<String, dynamic>? data) async {
    bool hasFile = data != null ? _processFiles(data) : false;

    logger.d("Data: $data");

    return _getDataOrHandleDioError(() async {
      Options options = await _makeOptions(tokenize);
      return _dio.post(
        _makeUrl(uri),
        data: hasFile ? FormData.fromMap(data) : data,
        options: options,
      );
    });
  }

  bool _processFiles(Map<String, dynamic> data) {
    bool hasFile = false;
    for (var key in data.keys) {
      if (data[key] is File) {
        File file = data[key];
        data[key] = MultipartFile.fromFileSync(file.path);
        hasFile = true;
      }
    }
    return hasFile;
  }

  Future<Resource> _handleAuthorizationError(Function func,
      {int retry = 1}) async {
    try {
      return await func();
    } on ApiException catch (e) {
      debugPrint('=================');
      if (e.code != 401) rethrow;
      if (retry <= 0) throw UnauthorizedException(e.message);
      await _refreshToken();
      return _handleAuthorizationError(func, retry: --retry);
    }
  }

  Future<Resource> _getDataOrHandleDioError(Function func, {int retry = 1}) async {
    try {
      final Response response = await func();
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        _logIfDebug(response);
        return Resource(response: response.data, messageCode: response.statusCode);
      } else if(response.statusCode == 401) {
        throw UnauthorizedException(response.data['message']?? "unauthorized exception");
      } else if(response.statusCode == 403) {
        throw UnauthorizedException("unauthorized exception");
      } else if(response.statusCode == 500) {
        return Resource(response: response.data ?? {"message": "Internal Server Error"},
            message: 'Internal Server Error',
            messageCode: 500);
      } else {
        _logIfDebug(response);
        return Resource(
            status: ResourceStatus.failed,
            messageCode: response.statusCode,
            message: response.data != null? response.data['message'] : 'failed'
        );
      }
    } on DioError catch (error) {
      logger.wtf(error, error.message, StackTrace.current);
      if (error.type == DioErrorType.sendTimeout) {
        throw Exception("Connection timeout exception");
      }
      if (error.type == DioErrorType.connectionError){ // check
        throw const SocketException("no internet");
      }
      if (error.response == null) {
        throw RepositoryUnavailableException(error.message);
      }
      return Resource(
        status: ResourceStatus.failed,
        message: error.message, //error.error ?? error.toString(),
        response: error.response,
      );
    }
  }

  void _logIfDebug(Response response) {
    if (_config.isNotDebug) return;
    logger.i(
      response.realUri.toString(),
    );
    logger.i(
      response.data,
    );
    logger.i(
      response.statusCode.toString(),
    );
  }

  String _getErrorMessage(Response response) {
    String message = response.data['message'];
    return message;
  }

  String _makeUrl(String uri) {
    return uri;
  }

  Future<Options> _makeOptions(bool tokenize) async {
    var headers = generateHeader();

    if (tokenize) {
      headers = await _addAuthHeader(headers);
    }
    return Options(
        headers: headers,
        sendTimeout: const Duration(milliseconds: 60 * 1000), // 60 * 1000
        receiveTimeout: const Duration(milliseconds: 30 * 1000), // 30000
        followRedirects: false,
        validateStatus: (status) {
          return status! <= 500;
        });
  }

  Map<String, dynamic> generateHeader() {
    var header = {
      "Accept": "application/json",
      // 'portal-name': _config.portal-nametalName,
      // 'user-id': "",
      // 'User-Agent': _config.systemInfo,
      // 'version-code': _config.versionCode,
    };
    return header;
  }

  Future<Map<String, dynamic>> _addAuthHeader(
      Map<String, dynamic> headers) async {
    String? token = await _getToken();
    headers["authorization"] = "Bearer $token";
    return headers;
  }


  Future<String?> _getToken() async {
    String? token;
    token = await _cache.get(SharedPreferenceConstant.jwt);
    if (token == null) throw ArgumentError.notNull("Token");
    return token;
  }

  Future<void> _refreshToken() async {
    isRefresh = true;
    String? token;
    try {
      await _handleAuthorizationError(() async {
        // _ongoingRefreshCall ??= _get(ApiUrl.getRefreshToken, true, {});
        var response = await _ongoingRefreshCall;
        _ongoingRefreshCall = null;
        if(response.messageCode != 400){
          token = response.response['token'];
          await _cache.put(SharedPreferenceConstant.jwt, token ?? "", const Duration(days: 100));
        }else if(response.messageCode == 400){
          _cache.flushAll().then((value) {
            final Locale appLocale = Localizations.localeOf(NavigationService.navigatorKey.currentContext!);
            _cache.forever(SharedPreferenceConstant.languageCode, appLocale.languageCode);
            // NavigationService.navigateToLoginAndClearStack(LoginScreen());
          });
        }
        return response;
      }, retry: 0);
    } on UnauthorizedException {
      // removeToken();
      rethrow;
    }
  }
}
