part of '../chat_inherited_state.dart';

mixin _ChatInheritedStateMixin on State<ChatInheritedProviderView> {
  /// Show more actions
  /// This method will show more actions for the chat
  Future<void> showMoreActions() async {
    await ApproveActionSheet.show(
      context: context,
      actions: [
        ChatifySheetAction(
          icon: CupertinoIcons.pin_fill,
          text: LocaleKeys.buttons_chat_pin.tr(),
          onPressed: () {},
        ),
        ChatifySheetAction(
          icon: CupertinoIcons.info_circle_fill,
          text: LocaleKeys.buttons_chat_info.tr(),
          onPressed: () {},
        ),
        ChatifySheetAction(
          icon: CupertinoIcons.delete,
          text: LocaleKeys.buttons_chat_clear.tr(),
          onPressed: () {},
        ),
      ],
    );
  }
}
