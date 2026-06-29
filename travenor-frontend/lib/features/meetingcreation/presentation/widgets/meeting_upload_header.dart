import 'package:flutter/material.dart';
import 'package:travenor/features/profile/presentation/screens/profile_screen.dart';

class MeetingUploadHeader extends StatelessWidget {
  const MeetingUploadHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(Icons.menu),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'New Meeting',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Let's explore the world",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ProfileScreen(),
                ),
              );
            },
            child: const CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(
                "https://i.pravatar.cc/150",
              ),
            ),
          ),
        ],
      ),
    );
  }
}