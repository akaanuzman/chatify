import 'package:auto_route/auto_route.dart';
import 'package:chatify_app/products/init/language/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

/// [ApproveAdaptiveYesNoDialog] is a [AlertDialog] with
/// [TextButton] for actions.
/// [title] is required.
/// [content] is required.
/// [onYesPressed] is optional.
/// If you want to call the method that will run when the yes button is clicked,
///  you must use [onYesPressed] parameter.
/// [onNoPressed] is optional.
/// If you want to call the method that will run when the no button is clicked,
/// you must use [onNoPressed] parameter.
/// [yesText] is optional.
/// If you want to change the text of the button, you must use
/// [yesText] parameter.
/// [noText] is optional.
/// If you want to change the text of the button, you must use
/// [noText] parameter.
/// [yesTextColor] is optional.
/// If you want to change the color of the text, you must use
/// [yesTextColor] parameter.
/// [noTextColor] is optional.
/// If you want to change the color of the text, you must use
/// [noTextColor] parameter.
///
/// [show] is a static method for show dialog.
final class ApproveAdaptiveYesNoDialog extends StatelessWidget {
  /// [ApproveAdaptiveYesNoDialog] is a [AlertDialog] with
  /// [TextButton] for actions.
  const ApproveAdaptiveYesNoDialog({
    required this.title,
    required this.content,
    super.key,
    this.onYesPressed,
    this.onNoPressed,
    this.yesText,
    this.noText,
    this.yesTextColor,
    this.noTextColor,
  });

  /// The title of the dialog.
  final String title;

  /// The content of the dialog.
  final String content;

  /// The key for the dialog.
  final void Function()? onYesPressed;

  /// The method that will run when the yes button is clicked.
  final void Function()? onNoPressed;

  /// The yes button text.
  final String? yesText;

  /// The no button text.
  final String? noText;

  /// The color of the yes button text.
  final Color? yesTextColor;

  /// The color of the no button text.
  final Color? noTextColor;

  /// [show] is a static method for show dialog.
  /// [context] is required.
  /// [title] is required.
  /// [content] is required.
  /// [onYesPressed] is optional.
  /// If you want to call the method that will run when the yes button is
  /// clicked, you must use [onYesPressed] parameter.
  /// [onNoPressed] is optional.
  /// If you want to call the method that will run when the no button is
  /// clicked, you must use [onNoPressed] parameter.
  /// [yesText] is optional.
  /// If you want to change the text of the button, you must use
  /// [yesText] parameter.
  /// [noText] is optional.
  /// If you want to change the text of the button, you must use
  /// [noText] parameter.
  /// [yesTextColor] is optional.
  /// If you want to change the color of the text, you must use
  /// [yesTextColor] parameter.
  /// [noTextColor] is optional.
  /// If you want to change the color of the text, you must use
  ///  [noTextColor] parameter.
  static Future<bool?> show({
    required BuildContext context,
    required String title,
    required String content,
    void Function()? onYesPressed,
    void Function()? onNoPressed,
    String? yesText,
    String? noText,
    Color? yesTextColor,
    Color? noTextColor,
    bool? barrierDismissible,
  }) async {
    return showAdaptiveDialog<bool?>(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (context) => ApproveAdaptiveYesNoDialog(
        title: title,
        content: content,
        onYesPressed: onYesPressed,
        onNoPressed: onNoPressed,
        yesText: yesText,
        noText: noText,
        yesTextColor: yesTextColor,
        noTextColor: noTextColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: Text(title),
      content: content == '' ? null : Text(content),
      actions: [
        _SpecialAction(
          label: noText ?? LocaleKeys.buttons_no,
          onPressed: onNoPressed,
          textColor: noTextColor ?? context.general.appTheme.colorScheme.error,
        ),
        _SpecialAction(
          label: yesText ?? LocaleKeys.buttons_yes,
          onPressed: onYesPressed,
          textColor: yesTextColor,
        ),
      ],
    );
  }
}

/// Special action for the dialog.
/// [label] is required.
/// [textColor] is optional.
/// If you want to change the color of the text, you must use
/// [textColor] parameter.
/// [onPressed] is optional.
/// If you want to call the method that will run when the button is clicked,
/// you must use [onPressed] parameter.
final class _SpecialAction extends StatelessWidget {
  const _SpecialAction({
    required this.label,
    this.textColor,
    this.onPressed,
  });
  final String label;
  final Color? textColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed ?? context.router.maybePop,
      child: Text(
        label.tr(),
        style: TextStyle(color: textColor),
        textAlign: TextAlign.center,
      ),
    );
  }
}
