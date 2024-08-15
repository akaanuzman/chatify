import 'package:chatify_app/features/home/chat/chat_view.dart';
import 'package:chatify_app/features/home/chat/state/chat_inherited_widget.dart';
import 'package:chatify_app/products/components/sheet/action/chatify_sheet_action.dart';
import 'package:chatify_app/products/components/sheet/approve_action_sheet.dart';
import 'package:chatify_app/products/init/language/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

part 'mixin/chat_inherited_mixin.dart';

/// The login inherited provider view
/// This view will provide inherited widget for the register view
/// It will also provide inherited state for the register view
final class ChatInheritedProviderView extends StatefulWidget {
  /// Default constructor
  const ChatInheritedProviderView({super.key});

  @override
  State<ChatInheritedProviderView> createState() =>
      ChatInheritedProviderState();
}

/// The state of the ChatInheritedProviderView
final class ChatInheritedProviderState extends State<ChatInheritedProviderView>
    with _ChatInheritedStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChatInherited(
        data: this,
        child: const ChatView(),
      ),
    );
  }
}
