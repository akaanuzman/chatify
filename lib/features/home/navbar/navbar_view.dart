import 'package:auto_route/auto_route.dart';
import 'package:chatify_app/features/home/navbar/mixin/navbar_view_mixin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@RoutePage()

/// Home view for the application
final class NavbarView extends StatefulWidget {
  /// Home view for the application
  const NavbarView({super.key});

  @override
  State<NavbarView> createState() => _NavbarViewState();
}

// TODO: REFACTOR EXTRACT THE SUBWIDGETS
class _NavbarViewState extends State<NavbarView> with NavbarViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ValueListenableBuilder<int>(
          valueListenable: selectedIndexNotifier,
          builder: (BuildContext context, int value, Widget? child) {
            return Text(labels.elementAt(selectedIndexNotifier.value));
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(CupertinoIcons.power),
            onPressed: () => logout(context),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: selectedIndexNotifier,
        builder: (BuildContext context, dynamic value, Widget? child) {
          return pages.elementAt(selectedIndexNotifier.value);
        },
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: selectedIndexNotifier,
        builder: (BuildContext context, int value, Widget? child) {
          return BottomNavigationBar(
            currentIndex: selectedIndexNotifier.value,
            onTap: (int index) => selectedIndex = index,
            items: bottomNavigationBarItems,
          );
        },
      ),
    );
  }
}
