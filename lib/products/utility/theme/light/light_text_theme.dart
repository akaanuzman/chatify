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
  @override
  TextTheme get currentTextTheme => ThemeData.light().textTheme.copyWith();
}