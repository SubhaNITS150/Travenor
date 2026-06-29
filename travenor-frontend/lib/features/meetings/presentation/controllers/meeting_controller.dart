import 'package:travenor/features/meetanalysis/data/models/discussed_destination_model.dart';
import 'package:travenor/features/meetingcreation/data/services/meeting_service.dart';
import 'package:travenor/features/meetings/data/models/meeting_models.dart';

class MeetingController {
  final MeetingService _meetingService = MeetingService();

  Future<List<MeetingResponseModel>> getRecentMeetings() async {
    return await _meetingService.getMyMeetings(limit: 3);
  }

  Future<List<MeetingResponseModel>> getAllMeetings() async {
    return await _meetingService.getMyMeetings();
  }

  Future<MeetingResponseModel> getMeetingById({
    required String meetingId,
  }) async {
    return await _meetingService.getMeetingById(meetingId: meetingId);
  }

  Future<List<DiscussedDestinationModel>> getDiscussedDestinations({
    required String meetingId,
  }) async {
    return await _meetingService.getDiscussedDestinations(meetingId: meetingId);
  }
}
