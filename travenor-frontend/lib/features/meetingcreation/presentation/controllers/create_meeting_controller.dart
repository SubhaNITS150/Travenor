import 'package:travenor/features/meetingcreation/data/services/meeting_service.dart';

class CreateMeetingController {
  final MeetingService _meetingService = MeetingService();

  Future<Map<String, dynamic>> createMeeting({
    required String meetingName,
  }) async {
    if (meetingName.trim().isEmpty) {
      throw Exception("Please enter a meeting name.");
    }

    return _meetingService.createMeeting(
      meetingName: meetingName,
    );
  }
}

class ProcessMeetingController {
  final MeetingService _meetingService = MeetingService();

  Future<void> processMeeting({
    required String meetingId,
  }) async {
    if (meetingId.trim().isEmpty) {
      throw Exception("Invalid meeting ID.");
    }

    await _meetingService.processMeeting(
      meetingId: meetingId,
    );
  }
}