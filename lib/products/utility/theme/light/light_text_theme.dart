import 'package:chatify_app/products/asset/colors.gen.dart';
import 'package:chatify_app/products/utility/theme/i_text_theme.dart';
import 'package:flutter/material.dart';

/// Light text theme for the application
/// This class provides the light text theme for the application
/// by implementing the IAppTextTheme interface
/// and providing the text theme data
/// Make sure to call the getTextTheme method to get the text theme data
/// and use it in the MaterialApp theme property
@immutable
final class LightTextTheme implements IAppTextTheme {
  final TextStyle _textStyle = const TextStyle(
    fontFamily: 'Montserrat',
    color: ColorName.darkText,
  );

  @override
  TextTheme get currentTextTheme => ThemeData.light().textTheme.copyWith(
        displayLarge: _textStyle,
        displayMedium: _textStyle,
        displaySmall: _textStyle,
        headlineLarge: _textStyle,
        headlineMedium: _textStyle,
        headlineSmall: _textStyle,
        titleLarge: _textStyle,
        titleMedium: _textStyle,
        titleSmall: _textStyle,
        bodyLarge: _textStyle,
        bodyMedium: _textStyle,
        bodySmall: _textStyle,
        labelLarge: _textStyle,
        labelMedium: _textStyle,
        labelSmall: _textStyle,
      );
}
