import 'dart:async';

import 'package:chatify_app/features/home/home_view.dart';
import 'package:chatify_app/products/init/app_initialize.dart';
import 'package:chatify_app/products/init/app_localizations.dart';
import 'package:chatify_app/products/utility/theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await AppInitialize().initialize();
  runApp(AppLocalizations(child: const _MyApp()));
}

final class _MyApp extends StatelessWidget {
  const _MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatify',
      home: const HomeView(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: const AppTheme(isDark: true).currentTheme,
    );
  }
}
