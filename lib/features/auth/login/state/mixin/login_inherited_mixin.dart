part of '../login_inherited_state.dart';

mixin _LoginInheritedStateMixin on State<LoginInheritedProviderView> {
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

  /// Go to the register page
  /// It will navigate to the register page
  void goToRegisterPage() =>
      context.router.push(const RegisterInheritedProviderRoute());
}
