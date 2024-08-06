import 'package:chatify_app/features/auth/login/state/login_inherited_state.dart';
import 'package:flutter/material.dart';

/// Login Inherited Widget
/// This class provides the inherited widget for the login view
/// by implementing the InheritedWidget interface
/// and providing the data
final class LoginInherited extends InheritedWidget {
  /// Constructor
  const LoginInherited({
    required super.child,
    required this.data,
    super.key,
  });

  /// Data
  final LoginInheritedProviderState data;

  /// Get current state of LoginInheritedState
  static LoginInheritedProviderState of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<LoginInherited>();
    if (result == null) {
      throw Exception('LoginInheritedState not found in context');
    }
    return result.data;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
