import 'package:chatify_app/features/home/chat/state/chat_inherited_state.dart';
import 'package:flutter/material.dart';

/// Chat Inherited Widget
/// This class provides the inherited widget for the Chat view
/// by implementing the InheritedWidget interface
/// and providing the data
final class ChatInherited extends InheritedWidget {
  /// Constructor
  const ChatInherited({
    required super.child,
    required this.data,
    super.key,
  });

  /// Data
  final ChatInheritedProviderState data;

  /// Get current state of ChatInheritedState
  static ChatInheritedProviderState of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<ChatInherited>();
    if (result == null) {
      throw Exception('ChatInheritedState not found in context');
    }
    return result.data;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
