import 'package:chatify_app/products/utility/theme/i_theme.dart';
import 'package:chatify_app/products/utility/theme/light/light_text_theme.dart';
import 'package:flutter/material.dart';

/// Dark theme for the application
/// This class provides the dark theme for the application
/// by implementing the IAppTheme interface
/// and providing the theme data
@immutable
final class LightTheme implements IAppTheme {
  @override
  ThemeData get currentTheme => ThemeData.light().copyWith(
        textTheme: currentTextTheme,
      );

  @override
  TextTheme get currentTextTheme => LightTextTheme().currentTextTheme;
}
