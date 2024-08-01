/// Project configuration values interface
abstract class AppConfiguration {
  /// The base url of the API
  /// It using from network manager
  String get baseUrl;

  /// The web socket url for the message system
  String get webSocketUrl;
}
