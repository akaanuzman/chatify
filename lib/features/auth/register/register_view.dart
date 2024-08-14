import 'package:chatify_app/features/auth/register/state/register_inherited_state.dart';
import 'package:chatify_app/features/auth/register/state/register_inherited_widget.dart';
import 'package:chatify_app/products/asset/assets.gen.dart';
import 'package:chatify_app/products/components/field/chatify_text_form_field.dart';
import 'package:chatify_app/products/components/field/email_field.dart';
import 'package:chatify_app/products/components/text/auth_card_title_and_subtitle.dart';
import 'package:chatify_app/products/init/language/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

extension _RegisterContext on BuildContext {
  /// Get inherited state of RegisterInheritedProviderState
  RegisterInheritedProviderState get inherited => RegisterInherited.of(this);
}

/// The register view of the app.
/// App will show this view when user is not logged in.
final class RegisterView extends StatefulWidget {
  /// The default constructor.
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: context.padding.normal,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: const _RegisterCard(),
      ),
    );
  }
}

/// The register card widget.
final class _RegisterCard extends StatelessWidget {
  const _RegisterCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: context.padding.medium,
        child: Column(
          children: [
            const _Image(),
            AuthCardTitleAndSubtitle(
              title: LocaleKeys.auth_register_title.tr(),
              subtitle: LocaleKeys.auth_register_description.tr(),
            ),
            context.sized.emptySizedHeightBoxLow3x,
            const _UsernameField(),
            context.sized.emptySizedHeightBoxLow,
            EmailField(emailController: context.inherited.emailController),
            context.sized.emptySizedHeightBoxLow,
            const _PasswordField(),
            context.sized.emptySizedHeightBoxLow,
            const _ConfrimPasswordField(),
            context.sized.emptySizedHeightBoxLow3x,
            const _SignInButton(),
            context.sized.emptySizedHeightBoxLow,
            const _AlreadyHaveAccount(),
          ],
        ),
      ),
    );
  }
}

/// The image widget.
final class _Image extends StatelessWidget {
  const _Image();

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: Assets.lotties.bgRegister.lottie(),
    );
  }
}

/// The username field widget.
final class _UsernameField extends StatelessWidget {
  const _UsernameField();

  @override
  Widget build(BuildContext context) {
    return ChatifyTextFormField(
      label: LocaleKeys.field_labels_username.tr(),
      hintText: LocaleKeys.field_hints_username.tr(),
      prefixIcon: const Icon(Icons.person),
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      controller: context.inherited.usernameController,
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
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}

/// The confrim password field widget.
final class _ConfrimPasswordField extends StatelessWidget {
  const _ConfrimPasswordField();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: context.inherited.confirmPasswordObscureTextNotifier,
      builder: (BuildContext context, bool value, Widget? child) {
        return ChatifyTextFormField(
          label: LocaleKeys.field_labels_password.tr(),
          hintText: LocaleKeys.field_hints_password.tr(),
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: _EyeIcon(
            obscureText: value,
            confirmPassword: true,
          ),
          obscureText: value,
          controller: context.inherited.confirmPasswordController,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
        );
      },
    );
  }
}

/// The eye icon widget.
final class _EyeIcon extends StatelessWidget {
  const _EyeIcon({required this.obscureText, this.confirmPassword = false});
  final bool obscureText;
  final bool confirmPassword;

  @override
  Widget build(BuildContext context) {
    if (obscureText) {
      return IconButton(
        icon: const Icon(Icons.visibility),
        onPressed: confirmPassword
            ? context.inherited.toggleConfirmPasswordObscureText
            : context.inherited.toggleObscureText,
      );
    } else {
      return IconButton(
        icon: const Icon(Icons.visibility_off),
        onPressed: confirmPassword
            ? context.inherited.toggleConfirmPasswordObscureText
            : context.inherited.toggleObscureText,
      );
    }
  }
}

/// The sign in button widget.
final class _SignInButton extends StatelessWidget {
  const _SignInButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: context.inherited.goToHomePage,
      child: const Text(LocaleKeys.buttons_auth_signUp).tr(),
    );
  }
}

/// The don't have an account widget.
final class _AlreadyHaveAccount extends StatelessWidget {
  const _AlreadyHaveAccount();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          LocaleKeys.auth_register_alreadyHaveAccount,
          style: context.general.textTheme.bodySmall,
        ).tr(),
        TextButton(
          onPressed: context.inherited.goToLoginPage,
          child: const Text(
            LocaleKeys.buttons_auth_signIn,
          ).tr(),
        ),
      ],
    );
  }
}
