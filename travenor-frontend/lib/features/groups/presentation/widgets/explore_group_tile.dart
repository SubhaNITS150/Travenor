import 'package:flutter/material.dart';

class ExploreGroupTile extends StatelessWidget {
  final String title;
  final String members;

  const ExploreGroupTile({
    super.key,
    required this.title,
    required this.members,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 28,
            child: Icon(Icons.school),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(members),
              ],
            ),
          ),

          OutlinedButton(
            onPressed: () {},
            child: const Text("Join"),
          ),
        ],
      ),
    );
  }
}