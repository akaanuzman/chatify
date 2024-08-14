import 'package:chatify_app/products/components/field/chatify_text_form_field.dart';
import 'package:chatify_app/products/init/language/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// The password field widget.
/// It will show the password field.
/// It uses ChatifyTextFormField.
final class PasswordField extends StatelessWidget {
  /// The default constructor.
  const PasswordField({
    required this.onPressed,
    required this.passwordController,
    required this.obscureText,
    this.label,
    this.textInputAction,
    super.key,
  });

  /// The on pressed function for obscureText.
  final void Function()? onPressed;

  /// The password controller.
  final TextEditingController passwordController;

  /// The obscure text.
  final bool obscureText;

  /// The label of the field.
  final String? label;

  /// The text input action of the field.
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return ChatifyTextFormField(
      label: label ?? LocaleKeys.field_labels_password.tr(),
      hintText: LocaleKeys.field_hints_password.tr(),
      prefixIcon: const Icon(Icons.lock),
      suffixIcon: _EyeIcon(
        obscureText: obscureText,
        onPressed: onPressed,
      ),
      obscureText: obscureText,
      controller: passwordController,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
    );
  }
}

/// The eye icon widget.
/// It will show the eye icon.
final class _EyeIcon extends StatelessWidget {
  const _EyeIcon({
    required this.obscureText,
    required this.onPressed,
  });
  final bool obscureText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    if (obscureText) {
      return IconButton(
        icon: const Icon(Icons.visibility),
        onPressed: onPressed,
      );
    } else {
      return IconButton(
        icon: const Icon(Icons.visibility_off),
        onPressed: onPressed,
      );
    }
  }
}
