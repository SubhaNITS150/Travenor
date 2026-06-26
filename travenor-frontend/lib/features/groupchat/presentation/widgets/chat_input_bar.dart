import 'package:flutter/material.dart';

class ChatInputBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback? onSend;
  final VoidCallback? onImageTap;
  final VoidCallback? onAudioTap;
  final VoidCallback? onAttachmentTap;

  const ChatInputBar({
    super.key,
    required this.controller,
    this.onSend,
    this.onImageTap,
    this.onAudioTap,
    this.onAttachmentTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        16,
        12,
        16,
        20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(
              0.05,
            ),
            blurRadius: 12,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            /// Attachment Button
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: const Color(0xFFF4F5F7),
                borderRadius:
                    BorderRadius.circular(14),
              ),
              child: IconButton(
                onPressed: onAttachmentTap,
                icon: const Icon(
                  Icons.add,
                  color: Color(0xFF6C63FF),
                ),
              ),
            ),

            const SizedBox(width: 10),

            /// Message Field
            Expanded(
              child: Container(
                height: 52,
                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                  color: const Color(
                    0xFFF4F5F7,
                  ),
                  borderRadius:
                      BorderRadius.circular(
                    26,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller,
                        textAlignVertical:
                            TextAlignVertical
                                .center,
                        decoration:
                            const InputDecoration(
                          hintText:
                              "Message group...",
                          border:
                              InputBorder.none,
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: onImageTap,
                      child: const Icon(
                        Icons.image_outlined,
                        color:
                            Color(0xFF6B7280),
                      ),
                    ),

                    const SizedBox(width: 12),

                    GestureDetector(
                      onTap: onAudioTap,
                      child: const Icon(
                        Icons.mic_none_rounded,
                        color:
                            Color(0xFF6B7280),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 10),

            /// Send Button
            Container(
              width: 52,
              height: 52,
              decoration: const BoxDecoration(
                color: Color(0xFF6C63FF),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: onSend,
                icon: const Icon(
                  Icons.send_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}