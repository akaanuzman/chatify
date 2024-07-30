import 'package:chatify_app/products/enums/devices_locales.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

@immutable

/// App localization class for [EasyLocalization] operations
final class AppLocalizations extends EasyLocalization {
  /// AppLocalizations need to [child] for a wrap locale item
  AppLocalizations({
    required super.child,
    super.path = _translationPath,
    super.key,
  }) : super(
          supportedLocales: _supportedLocales,
          useOnlyLangCode: true,
        );

  static final List<Locale> _supportedLocales = [
    DeviceLocales.tr.locale,
    DeviceLocales.en.locale,
  ];

  /// Translation path for [EasyLocalization]
  static const String _translationPath = 'assets/translations';

  /// Change language method by using  [context] and [selectedLocale]
  static Future<void> changeLanguage({
    required BuildContext context,
    required DeviceLocales selectedLocale,
  }) =>
      context.setLocale(selectedLocale.locale);
}
