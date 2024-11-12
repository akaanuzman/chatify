import 'package:auto_route/auto_route.dart';
import 'package:chatify_app/features/home/settings/mixin/settings_view_mixin.dart';
import 'package:chatify_app/products/init/language/locale_keys.g.dart';
import 'package:chatify_app/products/routers/app_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

/// The settings view.
final class SettingsView extends StatefulWidget {
  /// The constructor for the settings view.
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> with SettingsViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: context.padding.low,
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const _UserProfileItem(
                avatarText: 'A',
                username: 'kaan',
              ),
              const Divider(indent: 0),
              _SettingsItem(
                icon: Icons.translate,
                title: LocaleKeys.settings_language_title,
                value: LocaleKeys.settings_language_options_turkish,
                onTap: () {},
              ),
              const Divider(indent: 0),
              _SettingsItem(
                icon: Icons.light_mode,
                title: LocaleKeys.settings_theme_title,
                value: LocaleKeys.settings_theme_options_dark,
                onTap: () {},
              ),
              const Divider(indent: 0),
              _SettingsItem(
                icon: Icons.lock_reset,
                title: LocaleKeys.buttons_settings_changePassword,
                onTap: () {},
              ),
              const Divider(indent: 0),
              _SettingsItem(
                icon: Icons.logout,
                title: LocaleKeys.buttons_settings_logout,
                onTap: () => logout(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// The user profile item.
final class _UserProfileItem extends StatelessWidget {
  /// The constructor for the user profile item.
  const _UserProfileItem({
    required this.avatarText,
    required this.username,
  });

  final String avatarText;
  final String username;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => context.router.push(const ProfileRoute()),
      title: Row(
        children: [
          CircleAvatar(
            child: Text(avatarText),
          ),
          context.sized.emptySizedWidthBoxLow3x,
          Text(username),
        ],
      ),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}

/// The settings item.
final class _SettingsItem extends StatelessWidget {
  /// The constructor for the settings item.
  const _SettingsItem({
    required this.icon,
    required this.title,
    required this.onTap,
    this.value,
  });
  final IconData icon;
  final String title;
  final String? value;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        title: Row(
          children: [
            Icon(icon),
            context.sized.emptySizedWidthBoxLow3x,
            Text(title.tr()),
          ],
        ),
        trailing: Visibility(
          visible: value != null,
          child: Text(value?.tr() ?? ''),
        ),
      ),
    );
  }
}
