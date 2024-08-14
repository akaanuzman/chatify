import 'package:chatify_app/products/asset/colors.gen.dart';
import 'package:chatify_app/products/components/border/chatify_input_border.dart';
import 'package:chatify_app/products/utility/theme/i_theme.dart';
import 'package:chatify_app/products/utility/theme/light/light_text_theme.dart';
import 'package:flutter/material.dart';

/// TODO: REFACTOR LATER

/// Dark theme for the application
/// This class provides the dark theme for the application
/// by implementing the IAppTheme interface
/// and providing the theme data
@immutable
final class LightTheme implements IAppTheme {
  @override
  TextTheme get currentTextTheme => LightTextTheme().currentTextTheme;

  @override
  ThemeData get currentTheme => ThemeData.light().copyWith(
        textTheme: currentTextTheme,
        primaryColor: ColorName.primary,
        colorScheme: const ColorScheme.light(
          primary: ColorName.primary,
        ),
        inputDecorationTheme: _inputDecorationTheme,
        elevatedButtonTheme: _elevatedButtonTheme,
        textButtonTheme: _textButtonTheme,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: ColorName.lightGray,
        ),
        appBarTheme: AppBarTheme(
          centerTitle: false,
          titleTextStyle: currentTextTheme.titleLarge?.copyWith(
            color: ColorName.darkText,
            fontSize: 20,
            fontFamily: 'Montserrat',
          ),
        ),
      );

  /// The input decoration theme for the application
  InputDecorationTheme get _inputDecorationTheme {
    return InputDecorationTheme(
      fillColor: ColorName.lightOrange.withOpacity(.1),
      filled: true,
      hintStyle: currentTextTheme.labelSmall?.copyWith(
        color: ColorName.gray,
        fontSize: 14,
        fontFamily: 'Montserrat',
      ),
      labelStyle: currentTextTheme.labelSmall?.copyWith(
        fontSize: 14,
        fontFamily: 'Montserrat',
      ),
      prefixIconColor: ColorName.primary,
      suffixIconColor: ColorName.primary,
      contentPadding: const EdgeInsets.all(16),
      border: DefaultOutlinedBorder(),
      focusedBorder: DefaultOutlinedBorder(
        color: ColorName.primary,
        width: 2,
      ),
      enabledBorder: DefaultOutlinedBorder(),
    );
  }

  /// The elevated button theme for the application
  ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorName.primary,
        foregroundColor: ColorName.lightText,
        minimumSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  /// The text button theme for the application
  TextButtonThemeData get _textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(
          color: ColorName.primary,
          fontSize: 12,
          fontFamily: 'Montserrat',
        ),
      ),
    );
  }
}
