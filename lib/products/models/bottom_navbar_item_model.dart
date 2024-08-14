import 'package:flutter/cupertino.dart';

/// Bottom navbar item model
/// Icon and label for the bottom navbar item
final class BottomNavbarItemModel extends BottomNavigationBarItem {
  /// Bottom navbar item model
  /// Icon and label for the bottom navbar item
  BottomNavbarItemModel({
    required IconData icon,
    required String label,
  }) : super(
          icon: Icon(icon),
          label: label,
        );
}
