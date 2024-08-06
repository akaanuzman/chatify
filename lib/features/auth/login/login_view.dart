import 'package:auto_route/auto_route.dart';
import 'package:chatify_app/features/auth/login/state/login_inherited_state.dart';
import 'package:chatify_app/features/auth/login/state/login_inherited_widget.dart';
import 'package:chatify_app/products/asset/assets.gen.dart';
import 'package:chatify_app/products/components/field/chatify_text_form_field.dart';
import 'package:chatify_app/products/init/language/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

extension _LoginContext on BuildContext {
  /// Get inherited state of LoginInheritedState
  LoginInheritedProviderState get inherited => LoginInherited.of(this);
}

@RoutePage()

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              context.sized.emptySizedHeightBoxNormal,
              Assets.lotties.bgLogin.lottie(),
              context.sized.emptySizedHeightBoxLow,
              Card(
                child: Padding(
                  padding: context.padding.medium,
                  child: Column(
                    children: [
                      Text(
                        LocaleKeys.login_title,
                        style: context.general.textTheme.bodyLarge,
                      ).tr(),
                      context.sized.emptySizedHeightBoxLow,
                      Text(
                        LocaleKeys.login_description,
                        style: context.general.textTheme.bodySmall,
                      ).tr(),
                      context.sized.emptySizedHeightBoxLow3x,
                      ChatifyTextFormField(
                        label: LocaleKeys.field_labels_email.tr(),
                        hintText: LocaleKeys.field_hints_email.tr(),
                        prefixIcon: const Icon(Icons.email),
                        controller: context.inherited.emailController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                      ),
                      context.sized.emptySizedHeightBoxLow,
                      ValueListenableBuilder<bool>(
                        valueListenable: context.inherited.obscureTextNotifier,
                        builder: (
                          BuildContext context,
                          bool value,
                          Widget? child,
                        ) {
                          return ChatifyTextFormField(
                            label: LocaleKeys.field_labels_password.tr(),
                            hintText: LocaleKeys.field_hints_password.tr(),
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: value
                                ? IconButton(
                                    icon: const Icon(Icons.visibility),
                                    onPressed:
                                        context.inherited.toggleObscureText,
                                  )
                                : IconButton(
                                    icon: const Icon(Icons.visibility_off),
                                    onPressed:
                                        context.inherited.toggleObscureText,
                                  ),
                            obscureText: value,
                            controller: context.inherited.passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                          );
                        },
                      ),
                      const _ForgotPasswordButton(),
                      context.sized.emptySizedHeightBoxLow3x,
                      const _SignInButton(),
                      context.sized.emptySizedHeightBoxLow,
                      const _DontHaveAnAccount(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
          LocaleKeys.login_buttons_forgotPassword.tr(),
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
      onPressed: () {},
      child: const Text(LocaleKeys.login_buttons_signIn).tr(),
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
          LocaleKeys.login_dontHaveAccount,
          style: context.general.textTheme.bodySmall,
        ).tr(),
        TextButton(
          onPressed: () {},
          child: const Text(
            LocaleKeys.login_buttons_signUp,
          ).tr(),
        ),
      ],
    );
  }
}
