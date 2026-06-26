import 'package:flutter/material.dart';
import 'package:travenor/features/groupchat/data/models/group_chat_models.dart';

class TextMessageBubble extends StatelessWidget {
  final GroupChatMessage message;

  const TextMessageBubble({
    super.key,
    required this.message,
  });

  String _formatTime(DateTime dateTime) {
    final hour = dateTime.hour > 12
        ? dateTime.hour - 12
        : dateTime.hour == 0
            ? 12
            : dateTime.hour;

    final minute =
        dateTime.minute.toString().padLeft(2, '0');

    final period =
        dateTime.hour >= 12 ? "PM" : "AM";

    return "$hour:$minute $period";
  }

  @override
  Widget build(BuildContext context) {
    final isMine = message.isMine;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 6,
      ),
      child: Row(
        mainAxisAlignment: isMine
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment:
            CrossAxisAlignment.end,
        children: [
          /// Avatar
          if (!isMine)
            CircleAvatar(
              radius: 18,
              backgroundImage:
                  NetworkImage(
                message.senderAvatar,
              ),
            ),

          if (!isMine)
            const SizedBox(width: 8),

          Flexible(
            child: Column(
              crossAxisAlignment: isMine
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                /// Sender Name
                if (!isMine)
                  Padding(
                    padding:
                        const EdgeInsets.only(
                      left: 4,
                      bottom: 4,
                    ),
                    child: Text(
                      message.senderName,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight:
                            FontWeight.w600,
                        color: Color(
                          0xFF6B7280,
                        ),
                      ),
                    ),
                  ),

                /// Message Bubble
                Container(
                  constraints:
                      const BoxConstraints(
                    maxWidth: 280,
                  ),
                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: isMine
                        ? const Color(
                            0xFF6C63FF,
                          )
                        : Colors.white,
                    borderRadius:
                        BorderRadius.only(
                      topLeft:
                          const Radius.circular(
                        20,
                      ),
                      topRight:
                          const Radius.circular(
                        20,
                      ),
                      bottomLeft:
                          Radius.circular(
                        isMine ? 20 : 4,
                      ),
                      bottomRight:
                          Radius.circular(
                        isMine ? 4 : 20,
                      ),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black
                            .withValues(
                          alpha: 0.05,
                        ),
                        blurRadius: 10,
                        offset:
                            const Offset(
                          0,
                          4,
                        ),
                      ),
                    ],
                  ),
                  child: Text(
                    message.content,
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.4,
                      color: isMine
                          ? Colors.white
                          : const Color(
                              0xFF1F2937,
                            ),
                    ),
                  ),
                ),

                const SizedBox(height: 4),

                /// Time
                Padding(
                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 4,
                  ),
                  child: Text(
                    _formatTime(
                      message.createdAt,
                    ),
                    style: const TextStyle(
                      fontSize: 11,
                      color: Color(
                        0xFF9CA3AF,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}