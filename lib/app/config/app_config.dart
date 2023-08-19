import '../../core/data/http/api_client_config.dart';

class AppConfig {
  static const String _prodEnvName = "production";
  static const String _devEnvName = "development";

  late String apiBaseUrl;
  late final String environment;
  late final bool debug;
  static final _appConfig = AppConfig._internal();
  AppConfig._internal();

  bool isProduction() {
    return environment == _prodEnvName;
  }

  bool isDevelopment() {
    return environment == _devEnvName;
  }

  bool isDebug() {
    return debug;
  }

  bool isNotDebug() {
    return !debug;
  }


  ApiClientConfig getApiClientConfig() {
    return ApiClientConfig(baseUrl: apiBaseUrl, isDebug: debug);

  }

  factory AppConfig() {
    return _appConfig;
  }
  loadData(Map<String, dynamic> map) {
    apiBaseUrl = map['API_BASE_URL'];
    debug = map['APP_DEBUG'] == "true";
    environment = map['APP_ENV'] ?? _prodEnvName;
  }
}

final AppConfig appConfig = AppConfig();