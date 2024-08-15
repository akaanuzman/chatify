import 'package:chatify_app/features/home/chat/state/chat_inherited_state.dart';
import 'package:chatify_app/features/home/chat/state/chat_inherited_widget.dart';
import 'package:chatify_app/products/asset/colors.gen.dart';
import 'package:chatify_app/products/init/language/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kartal/kartal.dart';

extension _ChatContext on BuildContext {
  /// Get inherited state of ChatInheritedProviderState
  ChatInheritedProviderState get inherited => ChatInherited.of(this);
}

/// The chat view for the chat page.
/// The chat view displays the chat list.
final class ChatView extends StatefulWidget {
  /// The chat view for the chat page.
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _SearchAndArchivedChats(),
            _ChatList(),
          ],
        ),
      ),
    );
  }
}

/// The search and archived chats for the chat view.
final class _SearchAndArchivedChats extends StatelessWidget {
  const _SearchAndArchivedChats();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.normal,
      child: Column(
        children: [
          CupertinoSearchTextField(
            placeholder: LocaleKeys.field_labels_search.tr(),
            onChanged: (String value) {},
            controller: TextEditingController(),
          ),
          context.sized.emptySizedHeightBoxLow3x,
          const _ArchivedChats(),
        ],
      ),
    );
  }
}

/// The archived chats for the chat view.
final class _ArchivedChats extends StatelessWidget {
  const _ArchivedChats();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(CupertinoIcons.archivebox),
              context.sized.emptySizedWidthBoxLow,
              const Text(LocaleKeys.chat_archived).tr(),
            ],
          ),
          Text(
            '30',
            textAlign: TextAlign.end,
            style: context.general.textTheme.bodySmall
                ?.copyWith(color: ColorName.primary),
          ),
        ],
      ),
    );
  }
}

/// The chat list for the chat view.
final class _ChatList extends StatelessWidget {
  const _ChatList();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return _ChatItem(index: index);
      },
      separatorBuilder: (BuildContext context, int index) =>
          const Divider(height: 1),
      itemCount: 50,
    );
  }
}

/// The chat item for the chat list.
final class _ChatItem extends StatelessWidget {
  const _ChatItem({
    required this.index,
  });

  /// index for key
  final int index;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: Key(index.toString()),
      endActionPane: const ActionPane(
        motion: DrawerMotion(),
        children: [_MoreAction(), _ArchiveAction()],
      ),
      child: const _ChatListItem(),
    );
  }
}

/// The more action for the chat list.
final class _MoreAction extends StatelessWidget {
  const _MoreAction();

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      onPressed: (context) async {
        await context.inherited.showMoreActions();
      },
      backgroundColor: ColorName.gray,
      foregroundColor: Colors.white,
      icon: CupertinoIcons.ellipsis,
      label: LocaleKeys.chat_more.tr(),
      padding: EdgeInsets.zero,
    );
  }
}

final class _ArchiveAction extends StatelessWidget {
  const _ArchiveAction();

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      onPressed: (context) {},
      backgroundColor: ColorName.primary,
      foregroundColor: Colors.white,
      icon: CupertinoIcons.archivebox_fill,
      label: LocaleKeys.chat_archive.tr(),
      padding: EdgeInsets.zero,
    );
  }
}

/// The chat item for the chat list.
final class _ChatListItem extends StatelessWidget {
  const _ChatListItem();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        child: Icon(CupertinoIcons.person_fill),
      ),
      title: const Text(
        'username',
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      subtitle: const Text(
        'wqdqwdqwdwqdqwdqwdqwdwq',
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      trailing: const Text(
        '09.07.2024',
      ),
      onTap: () {},
    );
  }
}
