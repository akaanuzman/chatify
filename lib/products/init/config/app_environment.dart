import 'package:chatify_app/products/utility/environment/index.dart';
import 'package:flutter/foundation.dart';

/// Application Environment Manager Class
final class AppEnvironment {
  /// Setup application environment
  AppEnvironment.setup({required AppConfiguration config}) {
    _config = config;
  }

  /// General application environment setup
  AppEnvironment.general() {
    _config = kDebugMode ? DevEnv() : ProdEnv();
  }

  static late final AppConfiguration _config;
}

/// Get application environment type
enum AppEnvironmentType {
  /// The base url of the API
  /// It using from network manager
  baseUrl;

  /// Get application environment type value
  String get value {
    try {
      switch (this) {
        case AppEnvironmentType.baseUrl:
          return AppEnvironment._config.baseUrl;
      }
    } catch (e) {
      throw Exception('AppEnvironmentType is not initialized.');
    }
  }
}
