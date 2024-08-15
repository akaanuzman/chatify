import 'package:flutter/cupertino.dart';
import 'package:kartal/kartal.dart';

/// [ChatifySheetAction] is a [CupertinoActionSheetAction] with
/// [Row] for actions.
/// [icon] is required.
/// If you want to add an icon to the action, you must use [icon] parameter.
/// [text] is required.
/// If you want to add text to the action, you must use [text] parameter.
/// [onPressed] is required.
/// If you want to call the method that will run when the action is clicked,
final class ChatifySheetAction extends StatelessWidget {
  /// Default constructor for [ChatifySheetAction].
  const ChatifySheetAction({
    required this.icon,
    required this.text,
    required this.onPressed,
    super.key,
  });

  /// The icon of the action.
  final IconData icon;

  /// The text of the action.
  final String text;

  /// The method that will run when the action is clicked.
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheetAction(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          context.sized.emptySizedWidthBoxLow,
          Text(
            text,
            style: context.general.appTheme.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
