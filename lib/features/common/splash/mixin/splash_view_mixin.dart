import 'package:auto_route/auto_route.dart';
import 'package:chatify_app/features/common/splash/splash_view.dart';
import 'package:chatify_app/products/routers/app_router.dart';
import 'package:flutter/material.dart';

/// This mixin is used for [SplashView] class
mixin SplashViewMixin on State<SplashView> {
  @override
  void initState() {
    /// Delayed 2 seconds for splash screen
    /// After 2 seconds, push to [NavbarRoute]
    /// We will some process in the future
    Future<void>.delayed(const Duration(seconds: 2), () {
      context.router.replace(
        const LoginInheritedProviderRoute(),
      );
    });
    super.initState();
  }
}
