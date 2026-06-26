import 'package:flutter/material.dart';

class MeetingHistoryCard extends StatelessWidget {
  const MeetingHistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: ListTile(
        leading: const Icon(
          Icons.history,
          color: Colors.blue,
        ),
        title: const Text("Meeting History"),
        subtitle:
            const Text("24 Meetings Completed"),
        trailing: const Icon(
          Icons.arrow_forward_ios,
        ),
      ),
    );
  }
}