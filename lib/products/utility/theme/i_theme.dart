import 'package:flutter/material.dart';

/// Interface for the application theme
/// Make sure to implement this interface in the theme class
/// and provide the theme data
abstract class IAppTheme {
  /// This method get the current theme data
  ThemeData get currentTheme;

  /// This method get the current text theme data
  TextTheme get currentTextTheme;
}
