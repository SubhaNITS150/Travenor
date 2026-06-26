import 'package:flutter/material.dart';
import 'package:travenor/features/meetings/presentation/widgets/meeting_model.dart';

class MeetingTile extends StatelessWidget {
  final MeetingModel meeting;

  const MeetingTile({
    super.key,
    required this.meeting,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      contentPadding: const EdgeInsets.all(12),
      leading: const CircleAvatar(
        child: Icon(Icons.description_outlined),
      ),
      title: Text(meeting.title),
      subtitle: Text(
        "${meeting.date} • ${meeting.duration} • ${meeting.size}",
      ),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}