import 'package:flutter/material.dart';
import 'package:travenor/features/groupchat/data/dummy/dummy_messages.dart';
import 'package:travenor/features/groupchat/data/dummy/dummy_polls.dart';
import 'package:travenor/features/groupchat/data/models/group_chat_models.dart';
import 'package:travenor/features/groupchat/presentation/widgets/audio_message_bubble.dart';
import 'package:travenor/features/groupchat/presentation/widgets/chat_input_bar.dart';
import 'package:travenor/features/groupchat/presentation/widgets/group_chat_header.dart';
import 'package:travenor/features/groupchat/presentation/widgets/group_tab_selector.dart';
import 'package:travenor/features/groupchat/presentation/widgets/poll_card.dart';
import 'package:travenor/features/groupchat/presentation/widgets/text_message_bubble.dart';

class GroupChatScreen extends StatefulWidget {
  final String groupName;
  final String destination;
  final int travelers;

  const GroupChatScreen({
    super.key,
    required this.groupName,
    required this.destination,
    required this.travelers,
  });

  @override
  State<GroupChatScreen> createState() => _GroupChatScreenState();
}

class _GroupChatScreenState extends State<GroupChatScreen> {
  final TextEditingController _messageController = TextEditingController();

  GroupTab _selectedTab = GroupTab.chats;

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _messageController.text.trim();

    if (text.isEmpty) return;

    /// Socket.IO integration later

    debugPrint(text);

    _messageController.clear();
  }

  Widget _buildMessage(GroupChatMessage message) {
    switch (message.type) {
      case MessageType.audio:
        return AudioMessageBubble(message: message);

      case MessageType.text:
        return TextMessageBubble(message: message);

      case MessageType.system:
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFEDEBFF),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                message.content,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF6C63FF),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        );

      case MessageType.image:
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Align(
            alignment: message.isMine
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                message.mediaUrl ?? '',
                width: 220,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
    }
  }

  Widget _buildChatsTab() {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      itemCount: dummyMessages.length,
      itemBuilder: (_, index) {
        return _buildMessage(dummyMessages[index]);
      },
    );
  }

  Widget _buildPollsTab() {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 8, bottom: 20),
      itemCount: dummyPolls.length,
      itemBuilder: (_, index) {
        return PollCard(
          poll: dummyPolls[index],
          onVote: (optionId) {
            debugPrint("Selected: $optionId");
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FD),

      body: SafeArea(
        child: Column(
          children: [
            GroupChatHeader(
              groupName: widget.groupName,
              destination: widget.destination,
              travelers: widget.travelers,
            ),

            GroupTabSelector(
              selectedTab: _selectedTab,
              onTabChanged: (GroupTab tab) {
                setState(() {
                  _selectedTab = tab;
                });
              },
            ),

            Expanded(
              child: _selectedTab == GroupTab.chats
                  ? _buildChatsTab()
                  : _buildPollsTab(),
            ),

            if (_selectedTab == GroupTab.chats)
              ChatInputBar(
                controller: _messageController,

                onSend: _sendMessage,

                onAudioTap: () {
                  debugPrint("Audio Upload");
                },

                onImageTap: () {
                  debugPrint("Image Upload");
                },

                onAttachmentTap: () {
                  debugPrint("Attachment");
                },
              ),
          ],
        ),
      ),
    );
  }
}
