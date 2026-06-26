import 'package:flutter/material.dart';

class GroupChatHeader extends StatelessWidget {
  final String groupName;
  final String destination;
  final int travelers;

  const GroupChatHeader({
    super.key,
    required this.groupName,
    required this.destination,
    required this.travelers,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        16,
        12,
        16,
        16,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: [
          /// Back Button
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F6FA),
              borderRadius: BorderRadius.circular(14),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 18,
              ),
            ),
          ),

          const SizedBox(width: 12),

          /// Group Information
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  groupName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1F2937),
                  ),
                ),

                const SizedBox(height: 4),

                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 14,
                      color: Color(0xFF8A8A8A),
                    ),

                    const SizedBox(width: 4),

                    Text(
                      destination,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF8A8A8A),
                      ),
                    ),

                    const SizedBox(width: 8),

                    const Text(
                      "•",
                      style: TextStyle(
                        color: Color(0xFF8A8A8A),
                      ),
                    ),

                    const SizedBox(width: 8),

                    Text(
                      "$travelers Travelers",
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF8A8A8A),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// Members Button
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F6FA),
              borderRadius: BorderRadius.circular(14),
            ),
            child: IconButton(
              onPressed: () {
                // Members bottom sheet later
              },
              icon: const Icon(
                Icons.group_outlined,
                size: 22,
              ),
            ),
          ),

          const SizedBox(width: 8),

          /// More Button
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F6FA),
              borderRadius: BorderRadius.circular(14),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                size: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}