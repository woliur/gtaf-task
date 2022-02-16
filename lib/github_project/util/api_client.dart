import 'dart:convert';
import 'dart:io' as IO;
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:gtaf_assignment/github_project/util/network_checker.dart';
import '../values/string.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiClient {

  static Future<dynamic> get(
      String url, dynamic parameters) async {
    try {
      Dio dio = await _dioClient();
      Response response = await dio.get(url, queryParameters: parameters);
      return _response(response);
    } catch (e) {
      return Future.error(e);
    }
  }

  static Future<Dio> _dioClient() async {
    try {
      bool network = await NetworkChecker.instance.check();
      if (!network) {
        throw (StringResource.internetError);
      }
      Dio dio = Dio(await _options());
      if (!kReleaseMode) {
        dio.interceptors.add(PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: false,
            error: true,
            compact: true,
            maxWidth: 90));
      }
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (IO.HttpClient client) {
        client.badCertificateCallback =
            (IO.X509Certificate cert, String host, int port) => true;
      };
      return dio;
    } catch (e) {
      print(e);
      return Future.error(e);
    }
  }

  static Future<BaseOptions> _options() async {
    return BaseOptions(
      connectTimeout: 50000,
      receiveTimeout: 50000,
      followRedirects: false,
      responseType: ResponseType.plain,
      contentType: 'application/json',
      validateStatus: (status) {
        return status! <= 500;
      },
    );
  }

  static dynamic _response(Response response) async {
    var responseJson;
    switch (response.statusCode) {
      case 200:
        responseJson = json.decode(response.toString());
        return responseJson;
        break;
      case 201:
        responseJson = json.decode(response.toString());
        return responseJson;
        break;
      case 400:
        responseJson = json.decode(response.toString());
        throw (responseJson);
        break;
      case 401:
        responseJson = json.decode(response.toString());
        throw (responseJson);
        break;
      case 403:
        throw ("403");
        break;
      case 404:
        responseJson = json.decode(response.toString());
        if (response.data["message"] != null) {
          throw (response.data["message"]);
        }
        throw ('Not Found Error!');
        break;
      case 500:
        throw ('Server Error!');
        break;
      case 422:
        responseJson = json.decode(response.toString());
        if (response.data["message"] != null) {
          throw (response.data["message"]);
        }
        throw ('422');
        break;
      default:
        throw ('Unknown Error!');
        break;
    }
  }

}