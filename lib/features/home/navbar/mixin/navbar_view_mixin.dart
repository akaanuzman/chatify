import 'package:chatify_app/features/home/chat/state/chat_inherited_state.dart';
import 'package:chatify_app/features/home/navbar/navbar_view.dart';
import 'package:chatify_app/features/home/settings/settings_view.dart';
import 'package:chatify_app/products/init/language/locale_keys.g.dart';
import 'package:chatify_app/products/models/bottom_navbar_item_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

/// The mixin for the [NavbarView] state.
mixin NavbarViewMixin on State<NavbarView> {
  /// The labels for the bottom navigation bar.
  final List<String> labels = <String>[
    LocaleKeys.navbar_chats.tr(),
    LocaleKeys.navbar_settings.tr(),
  ];

  /// The icons for the bottom navigation bar.
  final List<IconData> icons = <IconData>[
    CupertinoIcons.chat_bubble_2_fill,
    CupertinoIcons.settings,
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
    const ChatInheritedProviderView(),
    const SettingsView(),
  ];

  /// The selected index notifier for the bottom navigation bar.
  final ValueNotifier<int> selectedIndexNotifier = ValueNotifier<int>(0);

  /// The bottom navigation bar item tapped event handler.
  set selectedIndex(int index) => selectedIndexNotifier.value = index;
}
