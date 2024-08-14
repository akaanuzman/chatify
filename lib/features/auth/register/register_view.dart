import 'package:auto_route/auto_route.dart';
import 'package:chatify_app/products/asset/assets.gen.dart';
import 'package:chatify_app/products/components/field/chatify_text_form_field.dart';
import 'package:chatify_app/products/init/language/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

@RoutePage()

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
            AspectRatio(
              aspectRatio: 2,
              child: Assets.lotties.bgRegister.lottie(),
            ),
            const _CardTitleAndSubtitle(),
            context.sized.emptySizedHeightBoxLow3x,
            ChatifyTextFormField(
              label: LocaleKeys.field_labels_username.tr(),
              hintText: LocaleKeys.field_hints_username.tr(),
              prefixIcon: const Icon(Icons.person),
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
            ),
            context.sized.emptySizedHeightBoxLow,
            const _EmailField(),
            context.sized.emptySizedHeightBoxLow,
            _PasswordField(valueListenable: ValueNotifier<bool>(false)),
            context.sized.emptySizedHeightBoxLow,
            _PasswordField(
              valueListenable: ValueNotifier<bool>(false),
              isConfrimPassword: true,
            ),
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

// TODO: MAKE COMPONENTS REUSABLE
/// The card title and subtitle widget.
final class _CardTitleAndSubtitle extends StatelessWidget {
  const _CardTitleAndSubtitle();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          LocaleKeys.auth_register_title,
          style: context.general.textTheme.bodyLarge,
        ).tr(),
        context.sized.emptySizedHeightBoxLow,
        Text(
          LocaleKeys.auth_register_description,
          style: context.general.textTheme.bodySmall,
        ).tr(),
      ],
    );
  }
}

final class _EmailField extends StatelessWidget {
  const _EmailField();

  @override
  Widget build(BuildContext context) {
    return ChatifyTextFormField(
      label: LocaleKeys.field_labels_email.tr(),
      hintText: LocaleKeys.field_hints_email.tr(),
      prefixIcon: const Icon(Icons.email),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );
  }
}

// TODO: MAKE COMPONENTS REUSABLE
/// The password field widget.
final class _PasswordField extends StatelessWidget {
  const _PasswordField({
    required this.valueListenable,
    this.isConfrimPassword = false,
  });
  final bool isConfrimPassword;
  final ValueListenable<bool> valueListenable;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: valueListenable,
      builder: (BuildContext context, bool value, Widget? child) {
        return ChatifyTextFormField(
          label: isConfrimPassword
              ? LocaleKeys.field_labels_confirmPassword.tr()
              : LocaleKeys.field_labels_password.tr(),
          hintText: LocaleKeys.field_hints_password.tr(),
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: _EyeIcon(obscureText: value),
          obscureText: value,
          keyboardType: TextInputType.visiblePassword,
          textInputAction:
              isConfrimPassword ? TextInputAction.done : TextInputAction.next,
        );
      },
    );
  }
}

// TODO: MAKE COMPONENTS REUSABLE
/// The eye icon widget.
final class _EyeIcon extends StatelessWidget {
  const _EyeIcon({required this.obscureText});
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    if (obscureText) {
      return IconButton(
        icon: const Icon(Icons.visibility),
        onPressed: () {},
      );
    } else {
      return IconButton(
        icon: const Icon(Icons.visibility_off),
        onPressed: () {},
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
      onPressed: () {},
      child: const Text(LocaleKeys.buttons_auth_signUp).tr(),
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
          LocaleKeys.auth_register_alreadyHaveAccount,
          style: context.general.textTheme.bodySmall,
        ).tr(),
        TextButton(
          onPressed: () {},
          child: const Text(
            LocaleKeys.buttons_auth_signIn,
          ).tr(),
        ),
      ],
    );
  }
}
