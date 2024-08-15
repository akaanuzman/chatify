import 'package:auto_route/auto_route.dart';
import 'package:chatify_app/products/init/language/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:kartal/kartal.dart';

/// [ApproveActionSheet] is a [CupertinoActionSheet] with
/// [CupertinoActionSheetAction] for actions.
/// [actions] is required.
/// If you want to add actions to the action sheet, you must use
/// [actions] parameter.
/// [show] is a static method for show action sheet.
final class ApproveActionSheet extends StatelessWidget {
  /// Default constructor for [ApproveActionSheet].
  const ApproveActionSheet({
    required this.actions,
    super.key,
    this.title,
    this.message,
  });

  /// The actions of the action sheet.
  final List<Widget>? actions;

  /// The title of the action sheet.
  final Widget? title;

  /// The message of the action sheet.
  final Widget? message;

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: title,
      message: message,
      actions: actions,
      cancelButton: CupertinoActionSheetAction(
        onPressed: context.maybePop,
        child: Text(
          LocaleKeys.buttons_cancel.tr(),
          style: TextStyle(color: context.general.appTheme.colorScheme.error),
        ),
      ),
    );
  }

  /// [show] is a static method for show action sheet.
  static Future<bool?> show({
    required BuildContext context,
    required List<Widget> actions,
    Widget? title,
    Widget? message,
  }) async {
    return showCupertinoModalPopup<bool>(
      context: context,
      builder: (context) => ApproveActionSheet(
        actions: actions,
        title: title,
        message: message,
      ),
    );
  }
}
