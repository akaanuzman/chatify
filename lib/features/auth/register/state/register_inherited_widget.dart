import 'package:chatify_app/features/auth/register/state/register_inherited_state.dart';
import 'package:flutter/material.dart';

/// Register Inherited Widget
/// This class provides the inherited widget for the login view
/// by implementing the InheritedWidget interface
/// and providing the data
final class RegisterInherited extends InheritedWidget {
  /// Constructor
  const RegisterInherited({
    required super.child,
    required this.data,
    super.key,
  });

  /// Data
  final RegisterInheritedProviderState data;

  /// Get current state of LoginInheritedState
  static RegisterInheritedProviderState of(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<RegisterInherited>();
    if (result == null) {
      throw Exception('LoginInheritedState not found in context');
    }
    return result.data;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
