import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

/// A text form field for Chatify.
/// This text form field is used in Chatify.
final class ChatifyTextFormField extends StatelessWidget {
  /// The default constructor.
  const ChatifyTextFormField({
    this.obscureText = false,
    super.key,
    this.label,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.keyboardType,
    this.textInputAction,
    this.focusNode,
  });

  /// The label of the text form field.
  final String? label;

  /// The hint text of the text form field.
  final String? hintText;

  /// The prefix icon of the text form field.
  final Widget? prefixIcon;

  /// The suffix icon of the text form field.
  final Widget? suffixIcon;

  /// The controller of the text form field.
  final TextEditingController? controller;

  /// Whether the text form field is obscure text or not.
  final bool obscureText;

  /// The keyboard type of the text form field.
  final TextInputType? keyboardType;

  /// The text input action of the text form field.
  final TextInputAction? textInputAction;

  /// The focus node of the text form field.
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding: context.padding.normal,
      ),
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
    );
  }
}
