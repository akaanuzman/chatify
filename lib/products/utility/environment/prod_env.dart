import 'package:chatify_app/products/utility/environment/index.dart';
import 'package:envied/envied.dart';

part 'prod_env.g.dart';

@Envied(
  obfuscate: true,
  path: 'assets/env/.prod.env',
)

/// Production environment configuration values
/// It using for production environment
final class ProdEnv implements AppConfiguration {
  @EnviedField(varName: 'BASE_URL')
  static final String _baseUrl = _ProdEnv._baseUrl;

  @EnviedField(varName: 'WEB_SOCKET_URL')
  static final String _webSocketUrl = _ProdEnv._webSocketUrl;

  @override
  String get baseUrl => _baseUrl;

  @override
  String get webSocketUrl => _webSocketUrl;
}
