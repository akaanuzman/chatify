import 'package:chatify_app/products/asset/colors.gen.dart';
import 'package:chatify_app/products/utility/theme/dark/dark_text_theme.dart';
import 'package:chatify_app/products/utility/theme/i_theme.dart';
import 'package:flutter/material.dart';

/// Dark theme for the application
/// This class provides the dark theme for the application
/// by implementing the IAppTheme interface
/// and providing the theme data
@immutable
final class DarkTheme implements IAppTheme {
  @override
  ThemeData get currentTheme => ThemeData.dark().copyWith(
        textTheme: currentTextTheme,
        primaryColor: ColorName.primary,
        colorScheme: const ColorScheme.dark(
          primary: ColorName.primary,
        ),
      );

  @override
  TextTheme get currentTextTheme => DarkTextTheme().currentTextTheme;
}
