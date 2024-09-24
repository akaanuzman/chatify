import 'package:auto_route/auto_route.dart';
import 'package:chatify_app/products/asset/colors.gen.dart';
import 'package:chatify_app/products/routers/app_router.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

/// The settings view.
final class SettingsView extends StatefulWidget {
  /// The constructor for the settings view.
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: context.padding.low,
        child: const Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _UserProfileItem(
                avatarText: 'A',
                username: 'kaan',
                subtitle: 'kaan',
              ),
              Divider(indent: 0),
              _SettingsItem(
                icon: Icons.translate,
                title: 'Language',
                value: 'English',
              ),
              Divider(indent: 0),
              _SettingsItem(
                icon: Icons.light_mode,
                title: 'Theme',
                value: 'Light',
              ),
              Divider(indent: 0),
              _SettingsItem(
                icon: Icons.logout,
                title: 'Logout',
                value: '',
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
    required this.subtitle,
  });

  final String avatarText;
  final String username;
  final String subtitle;

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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(username),
              Text(
                subtitle,
                style: context.general.textTheme.bodySmall?.copyWith(
                  color: ColorName.gray,
                ),
              ),
            ],
          ),
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
    required this.value,
  });
  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Icon(icon),
          context.sized.emptySizedWidthBoxLow3x,
          Text(title),
        ],
      ),
      trailing: Text(value),
    );
  }
}
