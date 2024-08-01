import 'package:flutter/material.dart';

/// Interface for the application text theme
/// Make sure to implement this interface in the text theme class
/// and provide the text theme data
abstract class IAppTextTheme {
  /// This method get the current text theme data
  TextTheme get currentTextTheme;
}
