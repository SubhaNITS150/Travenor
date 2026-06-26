import 'package:flutter/material.dart';

class GroupsSearchBar extends StatelessWidget {
  const GroupsSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: const Row(
        children: [
          Icon(Icons.search, color: Colors.grey),
          SizedBox(width: 12),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search groups...",
              ),
            ),
          ),
          Icon(
            Icons.tune,
            color: Color(0xFF5B4CFF),
          )
        ],
      ),
    );
  }
}