import 'package:chatify_app/products/enums/devices_locales.dart';
import 'package:chatify_app/products/init/app_localizations.dart';
import 'package:chatify_app/products/init/language/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// Home view for the application
final class HomeView extends StatelessWidget {
  /// Home view for the application
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(LocaleKeys.home_title).tr(),
            const Text(LocaleKeys.home_description).tr(),
            ElevatedButton(
              onPressed: () {
                context.locale == DeviceLocales.tr.locale
                    ? AppLocalizations.changeLanguage(
                        context: context,
                        selectedLocale: DeviceLocales.en,
                      )
                    : AppLocalizations.changeLanguage(
                        context: context,
                        selectedLocale: DeviceLocales.tr,
                      );
              },
              child: const Text(LocaleKeys.general_buttons_save).tr(),
            ),
          ],
        ),
      ),
    );
  }
}
