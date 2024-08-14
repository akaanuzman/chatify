part of '../register_inherited_state.dart';

mixin _RegisterInheritedStateMixin on State<RegisterInheritedProviderView> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> formValidateNotifier = ValueNotifier<bool>(false);
  final ValueNotifier<bool> obscureTextNotifier = ValueNotifier<bool>(true);
  final ValueNotifier<bool> confirmPasswordObscureTextNotifier =
      ValueNotifier<bool>(true);

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  /// Toggle obscure text
  void toggleObscureText() {
    obscureTextNotifier.value = !obscureTextNotifier.value;
  }

  /// Toggle confirm password obscure text
  void toggleConfirmPasswordObscureText() {
    confirmPasswordObscureTextNotifier.value =
        !confirmPasswordObscureTextNotifier.value;
  }

  /// Check form validate for password, email, and username
  /// if all of them are valid, then it will return true
  void checkFormValidate() {
    formValidateNotifier.value = formKey.currentState?.validate() ?? false;
  }

  /// Go to the login page
  /// It will navigate to the login page
  void goToLoginPage() => context.router.maybePop();
}
