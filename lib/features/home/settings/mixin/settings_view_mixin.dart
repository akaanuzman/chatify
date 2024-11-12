import 'package:auto_route/auto_route.dart';
import 'package:chatify_app/features/home/settings/settings_view.dart';
import 'package:chatify_app/products/components/dialog/approve_adaptive_yes_no_dialog.dart';
import 'package:chatify_app/products/init/language/locale_keys.g.dart';
import 'package:chatify_app/products/routers/app_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// The mixin for the [SettingsView] state.
/// Contains the logout event handler.
/// Navigates to the login page.
mixin SettingsViewMixin on State<SettingsView> {
  /// Logout event handler.
  /// Navigates to the login page.
  Future<void> logout(BuildContext context) async {
    await ApproveAdaptiveYesNoDialog.show(
      context: context,
      title: LocaleKeys.dialogs_logout_title.tr(),
      content: LocaleKeys.dialogs_logout_message.tr(),
      onYesPressed: () {
        _goToLoginRoute(context);
      },
    );
  }

  void _goToLoginRoute(BuildContext context) {
    context.router.pushAndPopUntil(
      const LoginInheritedProviderRoute(),
      predicate: (_) => false,
    );
  }
}
