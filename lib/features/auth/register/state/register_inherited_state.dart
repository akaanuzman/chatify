import 'package:auto_route/auto_route.dart';
import 'package:chatify_app/features/auth/register/register_view.dart';
import 'package:chatify_app/features/auth/register/state/register_inherited_widget.dart';
import 'package:chatify_app/products/routers/app_router.dart';
import 'package:flutter/material.dart';

part 'mixin/register_inherited_mixin.dart';

@RoutePage()

/// The login inherited provider view
/// This view will provide inherited widget for the register view
/// It will also provide inherited state for the register view
final class RegisterInheritedProviderView extends StatefulWidget {
  /// Default constructor
  const RegisterInheritedProviderView({super.key});

  @override
  State<RegisterInheritedProviderView> createState() =>
      RegisterInheritedProviderState();
}

/// The state of the RegisterInheritedProviderView
final class RegisterInheritedProviderState
    extends State<RegisterInheritedProviderView>
    with _RegisterInheritedStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RegisterInherited(
        data: this,
        child: const RegisterView(),
      ),
    );
  }
}
