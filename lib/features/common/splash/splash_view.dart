import 'package:auto_route/auto_route.dart';
import 'package:chatify_app/features/common/splash/mixin/splash_view_mixin.dart';
import 'package:chatify_app/products/asset/assets.gen.dart';
import 'package:chatify_app/products/init/language/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

/// The splash view of the app.
/// App will show this view when it is started.
@RoutePage()
final class SplashView extends StatefulWidget {
  /// The default constructor.
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with SplashViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// The app logo
          Assets.icons.icMain.image(),

          /// The app title
          Text(
            LocaleKeys.splash_title,
            style: context.general.textTheme.headlineLarge,
          ).tr(),

          context.sized.emptySizedHeightBoxLow,

          /// The app description
          const Text(LocaleKeys.splash_description).tr(),
        ],
      ),
    );
  }
}
