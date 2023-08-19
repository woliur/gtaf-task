import '../../../app/config/app_config.dart';

class ApiUrl {
  static final baseUrl = appConfig.getApiClientConfig().baseUrl;

  static String commitList = "$baseUrl/repos/flutter/flutter/commits";
  // static String commitUserProfile = "$baseUrl/users/blasten";
  static String commitUserProfile = "$baseUrl/users/web-flow";
}
