import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

@immutable

/// This class is used to initialize the app process.
final class AppInitialize {
  /// This method is used to initialize the app process.
  Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    await runZonedGuarded<Future<void>>(
      _initialize,
      (error, stack) {
        /// crashlytics insert here
      },
    );
  }

  Future<void> _initialize() async {
    await EasyLocalization.ensureInitialized();
    EasyLocalization.logger.enableLevels = [LevelMessages.error];
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    // await DeviceUtility.instance.initPackageInfo();

    FlutterError.onError = (details) {
      // crashlytics insert here
      // custom logger or custom service insert here

      // Logger().e(details.exceptionAsString());
    };

    // AppEnvironment.general();
  }
}
