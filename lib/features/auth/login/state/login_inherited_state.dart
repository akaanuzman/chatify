import 'package:auto_route/auto_route.dart';
import 'package:chatify_app/features/auth/login/login_view.dart';
import 'package:chatify_app/features/auth/login/state/login_inherited_widget.dart';
import 'package:flutter/material.dart';

part 'mixin/login_inherited_mixin.dart';

@RoutePage()

/// The login inherited provider view
/// This view will provide inherited widget for the login view
/// It will also provide inherited state for the login view
final class LoginInheritedProviderView extends StatefulWidget {
  /// Default constructor
  const LoginInheritedProviderView({super.key});

  @override
  State<LoginInheritedProviderView> createState() =>
      LoginInheritedProviderState();
}

/// The state of the LoginInheritedProviderView
final class LoginInheritedProviderState
    extends State<LoginInheritedProviderView> with _LoginInheritedStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginInherited(
        data: this,
        child: const LoginView(),
      ),
    );
  }
}
