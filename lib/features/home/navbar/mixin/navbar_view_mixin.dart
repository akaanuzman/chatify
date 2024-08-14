import 'package:auto_route/auto_route.dart';
import 'package:chatify_app/features/home/navbar/navbar_view.dart';
import 'package:chatify_app/products/components/dialog/approve_adaptive_yes_no_dialog.dart';
import 'package:chatify_app/products/init/language/locale_keys.g.dart';
import 'package:chatify_app/products/models/bottom_navbar_item_model.dart';
import 'package:chatify_app/products/routers/app_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

/// The mixin for the [NavbarView] state.
mixin NavbarViewMixin on State<NavbarView> {
  /// The labels for the bottom navigation bar.
  final List<String> labels = <String>[
    LocaleKeys.navbar_messages.tr(),
    LocaleKeys.navbar_settings.tr(),
    LocaleKeys.navbar_profile.tr(),
  ];

  /// The icons for the bottom navigation bar.
  final List<IconData> icons = <IconData>[
    CupertinoIcons.chat_bubble_2_fill,
    CupertinoIcons.settings,
    CupertinoIcons.person_fill,
  ];

  /// The bottom navigation bar items.
  List<BottomNavigationBarItem> get bottomNavigationBarItems =>
      List<BottomNavbarItemModel>.generate(
        icons.length,
        (int index) => BottomNavbarItemModel(
          icon: icons[index],
          label: labels[index],
        ),
      );

  /// The pages for the bottom navigation bar.
  final List<Widget> pages = <Widget>[
    const Center(child: Text('Messages')),
    const Center(child: Text('Settings')),
    const Center(child: Text('Profile')),
  ];

  /// The selected index notifier for the bottom navigation bar.
  final ValueNotifier<int> selectedIndexNotifier = ValueNotifier<int>(0);

  /// The bottom navigation bar item tapped event handler.
  set selectedIndex(int index) => selectedIndexNotifier.value = index;

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
