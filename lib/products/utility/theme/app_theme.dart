import 'package:chatify_app/products/utility/theme/dark/dark_text_theme.dart';
import 'package:chatify_app/products/utility/theme/dark/dark_theme.dart';
import 'package:chatify_app/products/utility/theme/i_theme.dart';
import 'package:chatify_app/products/utility/theme/light/light_text_theme.dart';
import 'package:chatify_app/products/utility/theme/light/light_theme.dart';
import 'package:flutter/material.dart';

/// Interface for the application theme
/// Make sure to implement this interface in the theme class
/// and provide the theme data
@immutable
final class AppTheme implements IAppTheme {
  /// Constructor for the application theme
  /// This constructor takes a boolean value to determine
  /// whether the theme is dark or light
  const AppTheme({required this.isDark});

  /// Boolean value to determine whether the theme is dark or light
  final bool isDark;

  @override
  TextTheme get currentTextTheme => isDark
      ? DarkTextTheme().currentTextTheme
      : LightTextTheme().currentTextTheme;

  @override
  ThemeData get currentTheme =>
      isDark ? DarkTheme().currentTheme : LightTheme().currentTheme;
}
