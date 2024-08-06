import 'package:chatify_app/features/auth/login/login_view.dart';
import 'package:chatify_app/features/auth/login/state/login_inherited_widget.dart';
import 'package:flutter/material.dart';

/// Cloud
class LoginInheritedProvider extends StatefulWidget {
  /// Default constructor
  const LoginInheritedProvider({super.key});

  @override
  State<LoginInheritedProvider> createState() => LoginInheritedProviderState();
}

class LoginInheritedProviderState extends State<LoginInheritedProvider>
    with _LoginInheritedStateMixin {
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

mixin _LoginInheritedStateMixin on State<LoginInheritedProvider> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> formValidateNotifier = ValueNotifier<bool>(false);
  final ValueNotifier<bool> obscureTextNotifier = ValueNotifier<bool>(true);

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  /// Toggle obscure text
  void toggleObscureText() =>
      obscureTextNotifier.value = !obscureTextNotifier.value;

  /// Check form validate for password, email, and username
  /// if all of them are valid, then it will return true
  void checkFormValidate() {
    formValidateNotifier.value = formKey.currentState?.validate() ?? false;
  }
}
