import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import '../../../app/config/app_config.dart';
import '../../data/cache/base_cache.dart';
import '../../data/cache/preference_cache.dart';
import '../../data/http/api_client.dart';
import '../../data/http/api_client_config.dart';

final serviceLocator = GetIt.instance;

Future<void> setUpServiceLocator(AppConfig appConfig) async {

  // serviceLocator.registerFactory<LanguageRepository>(() =>
  //     LanguageRepositoryImpl(serviceLocator<BaseCache>()));

  serviceLocator.registerFactory<ApiClient>(() =>
      ApiClient(
          serviceLocator<ApiClientConfig>(),
          serviceLocator<BaseCache>(),
          Logger()));
  serviceLocator.registerFactory<BaseCache>(() => PreferenceCache());

  serviceLocator.registerFactory<Logger>(() => Logger());

  serviceLocator.registerFactory<ApiClientConfig>(() =>
      ApiClientConfig(
        baseUrl: appConfig.apiBaseUrl,
        isDebug: appConfig.debug,
      )
  );
}