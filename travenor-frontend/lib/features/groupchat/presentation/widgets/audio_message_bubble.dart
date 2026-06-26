import 'package:flutter/material.dart';
import 'package:travenor/features/groupchat/data/models/group_chat_models.dart';

class AudioMessageBubble extends StatelessWidget {
  final GroupChatMessage message;

  const AudioMessageBubble({
    super.key,
    required this.message,
  });

  String _formatTime(DateTime dateTime) {
    final hour = dateTime.hour > 12
        ? dateTime.hour - 12
        : dateTime.hour;

    final minute =
        dateTime.minute.toString().padLeft(2, '0');

    final period =
        dateTime.hour >= 12 ? "PM" : "AM";

    return "$hour:$minute $period";
  }

  String _formatDuration(Duration? duration) {
    if (duration == null) return "00:00";

    final minutes = duration.inMinutes
        .toString()
        .padLeft(2, '0');

    final seconds = (duration.inSeconds % 60)
        .toString()
        .padLeft(2, '0');

    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    final isMine = message.isMine;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(
        mainAxisAlignment: isMine
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment:
            CrossAxisAlignment.end,
        children: [
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

                Container(
                  padding:
                      const EdgeInsets.all(14),
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
                  child: Row(
                    mainAxisSize:
                        MainAxisSize.min,
                    children: [
                      Container(
                        width: 42,
                        height: 42,
                        decoration:
                            BoxDecoration(
                          color: isMine
                              ? Colors.white
                                  .withValues(
                                  alpha: 0.2,
                                )
                              : const Color(
                                  0xFFF3F4F6,
                                ),
                          shape:
                              BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.play_arrow,
                          color: isMine
                              ? Colors.white
                              : const Color(
                                  0xFF6C63FF,
                                ),
                        ),
                      ),

                      const SizedBox(
                        width: 12,
                      ),

                      SizedBox(
                        width: 120,
                        child: Row(
                          children:
                              List.generate(
                            18,
                            (index) =>
                                Expanded(
                              child:
                                  Container(
                                margin:
                                    const EdgeInsets
                                        .symmetric(
                                  horizontal:
                                      1,
                                ),
                                height:
                                    (index %
                                                5 +
                                            1) *
                                        4.0,
                                decoration:
                                    BoxDecoration(
                                  color: isMine
                                      ? Colors
                                          .white70
                                      : Colors
                                          .grey
                                          .shade400,
                                  borderRadius:
                                      BorderRadius.circular(
                                    10,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(
                        width: 12,
                      ),

                      Text(
                        _formatDuration(
                          message
                              .audioDuration,
                        ),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight:
                              FontWeight.w600,
                          color: isMine
                              ? Colors.white
                              : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 4),

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