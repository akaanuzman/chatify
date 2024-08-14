import 'package:chatify_app/features/auth/login/state/login_inherited_state.dart';
import 'package:chatify_app/features/auth/login/state/login_inherited_widget.dart';
import 'package:chatify_app/products/asset/assets.gen.dart';
import 'package:chatify_app/products/components/field/chatify_text_form_field.dart';
import 'package:chatify_app/products/components/field/email_field.dart';
import 'package:chatify_app/products/components/text/auth_card_title_and_subtitle.dart';
import 'package:chatify_app/products/init/language/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

extension _LoginContext on BuildContext {
  /// Get inherited state of LoginInheritedState
  LoginInheritedProviderState get inherited => LoginInherited.of(this);
}

/// The login view of the app.
/// App will show this view when user is not logged in.
final class LoginView extends StatefulWidget {
  /// The default constructor.
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: context.inherited.formKey,
        child: SingleChildScrollView(
          padding: context.padding.normal,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: const _LoginSection(),
        ),
      ),
    );
  }
}

/// The login section widget.
final class _LoginSection extends StatelessWidget {
  const _LoginSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        context.sized.emptySizedHeightBoxNormal,
        Assets.lotties.bgLogin.lottie(),
        context.sized.emptySizedHeightBoxLow,
        const _LoginCard(),
      ],
    );
  }
}

/// The login card widget.
final class _LoginCard extends StatelessWidget {
  const _LoginCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: context.padding.medium,
        child: Column(
          children: [
            AuthCardTitleAndSubtitle(
              title: LocaleKeys.auth_login_title.tr(),
              subtitle: LocaleKeys.auth_login_description.tr(),
            ),
            context.sized.emptySizedHeightBoxLow3x,
            EmailField(emailController: context.inherited.emailController),
            context.sized.emptySizedHeightBoxLow,
            const _PasswordField(),
            const _ForgotPasswordButton(),
            context.sized.emptySizedHeightBoxLow3x,
            const _SignInButton(),
            context.sized.emptySizedHeightBoxLow,
            const _DontHaveAnAccount(),
          ],
        ),
      ),
    );
  }
}

/// The password field widget.
final class _PasswordField extends StatelessWidget {
  const _PasswordField();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: context.inherited.obscureTextNotifier,
      builder: (BuildContext context, bool value, Widget? child) {
        return ChatifyTextFormField(
          label: LocaleKeys.field_labels_password.tr(),
          hintText: LocaleKeys.field_hints_password.tr(),
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: _EyeIcon(obscureText: value),
          obscureText: value,
          controller: context.inherited.passwordController,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
        );
      },
    );
  }
}

/// The eye icon widget.
final class _EyeIcon extends StatelessWidget {
  const _EyeIcon({required this.obscureText});
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    if (obscureText) {
      return IconButton(
        icon: const Icon(Icons.visibility),
        onPressed: context.inherited.toggleObscureText,
      );
    } else {
      return IconButton(
        icon: const Icon(Icons.visibility_off),
        onPressed: context.inherited.toggleObscureText,
      );
    }
  }
}

/// The forgot password button widget.
final class _ForgotPasswordButton extends StatelessWidget {
  const _ForgotPasswordButton();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: Text(
          LocaleKeys.buttons_auth_forgotPassword.tr(),
        ).tr(),
      ),
    );
  }
}

/// The sign in button widget.
final class _SignInButton extends StatelessWidget {
  const _SignInButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: context.inherited.goToHomePage,
      child: const Text(LocaleKeys.buttons_auth_signIn).tr(),
    );
  }
}

/// The don't have an account widget.
final class _DontHaveAnAccount extends StatelessWidget {
  const _DontHaveAnAccount();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          LocaleKeys.auth_login_dontHaveAccount,
          style: context.general.textTheme.bodySmall,
        ).tr(),
        TextButton(
          onPressed: context.inherited.goToRegisterPage,
          child: const Text(
            LocaleKeys.buttons_auth_signUp,
          ).tr(),
        ),
      ],
    );
  }
}
