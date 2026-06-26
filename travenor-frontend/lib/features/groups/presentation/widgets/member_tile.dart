import 'package:flutter/material.dart';

class MemberTile extends StatelessWidget {
  final String email;
  final VoidCallback onDelete;

  const MemberTile({
    super.key,
    required this.email,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(14),
      ),

      child: Row(
        children: [
          const CircleAvatar(
            child: Icon(Icons.person),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Text(email),
          ),

          IconButton(
            onPressed: onDelete,
            icon: const Icon(
              Icons.delete_outline,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}