import 'package:flutter/material.dart';
import 'package:travenor/features/meetings/data/models/meeting_models.dart';

class MeetingTile extends StatelessWidget {
  final MeetingResponseModel meeting;

  const MeetingTile({
    super.key,
    required this.meeting,
  });

  String _formatDate(DateTime date) {
    const months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ];

    return "${date.day} ${months[date.month - 1]}";
  }

  Color _statusColor() {
    switch (meeting.status.toUpperCase()) {
      case "COMPLETED":
        return Colors.green;

      case "PROCESSING":
        return Colors.orange;

      case "FAILED":
        return Colors.red;

      case "AUDIO_UPLOADED":
        return Colors.blue;

      default:
        return Colors.grey;
    }
  }

  IconData _statusIcon() {
    switch (meeting.status.toUpperCase()) {
      case "COMPLETED":
        return Icons.check_circle;

      case "PROCESSING":
        return Icons.hourglass_top;

      case "FAILED":
        return Icons.error;

      case "AUDIO_UPLOADED":
        return Icons.cloud_upload;

      default:
        return Icons.description_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      contentPadding: const EdgeInsets.all(12),

      leading: CircleAvatar(
        backgroundColor: _statusColor().withValues(alpha: .12),
        child: Icon(
          _statusIcon(),
          color: _statusColor(),
        ),
      ),

      title: Text(
        meeting.meetingName,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),

      subtitle: Text(
        "${_formatDate(meeting.createdAt)} • ${meeting.status}",
      ),

      trailing: const Icon(
        Icons.chevron_right,
      ),
    );
  }
}