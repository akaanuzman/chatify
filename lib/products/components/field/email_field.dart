import 'package:chatify_app/products/components/field/chatify_text_form_field.dart';
import 'package:chatify_app/products/init/language/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// The email field widget.
/// It will show the email field.
/// It uses ChatifyTextFormField.
/// It requires emailController.
final class EmailField extends StatelessWidget {
  /// The default constructor.
  const EmailField({required this.emailController, super.key});

  /// The email controller.
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return ChatifyTextFormField(
      label: LocaleKeys.field_labels_email.tr(),
      hintText: LocaleKeys.field_hints_email.tr(),
      prefixIcon: const Icon(Icons.email),
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );
  }
}
