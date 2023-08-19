import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../core/domain/service_locator/service_locator.dart';
import '../config/app_config.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  await dotenv.load();
  appConfig.loadData(dotenv.env);
  await setUpServiceLocator(appConfig);
  await runZonedGuarded(
        () async {
      runApp(await builder());
    },
        (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
