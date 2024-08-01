import 'package:chatify_app/products/utility/environment/index.dart';
import 'package:envied/envied.dart';

part 'dev_env.g.dart';

@Envied(
  obfuscate: true,
  path: 'assets/env/.dev.env',
)

/// Development environment configuration values
/// It using for development environment
final class DevEnv implements AppConfiguration {
  @EnviedField(varName: 'BASE_URL')
  static final String _baseUrl = _DevEnv._baseUrl;

  @EnviedField(varName: 'WEB_SOCKET_URL')
  static final String _webSocketUrl = _DevEnv._webSocketUrl;

  @override
  String get baseUrl => _baseUrl;

  @override
  String get webSocketUrl => _webSocketUrl;
}
