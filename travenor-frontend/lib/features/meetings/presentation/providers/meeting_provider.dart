import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travenor/features/meetings/data/models/meeting_models.dart';
import 'package:travenor/features/meetings/presentation/controllers/meeting_controller.dart';

final meetingControllerProvider = Provider<MeetingController>((ref) {
  return MeetingController();
});

class RecentMeetingsNotifier extends AsyncNotifier<List<MeetingResponseModel>> {
  final Map<String, Timer> _pollingTimers = {};

  @override
  Future<List<MeetingResponseModel>> build() async {
    ref.onDispose(() {
      for (final timer in _pollingTimers.values) {
        timer.cancel();
      }
      _pollingTimers.clear();
    });

    final meetings = await _fetch();
    _startPollingForProcessing(meetings);
    return meetings;
  }

  Future<List<MeetingResponseModel>> _fetch() {
    final controller = ref.read(meetingControllerProvider);
    return controller.getRecentMeetings();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final meetings = await _fetch();
      _startPollingForProcessing(meetings);
      return meetings;
    });
  }

  void addMeeting(MeetingResponseModel newMeeting) {
    // ✅ explicit typed cast
    final current = state.maybeWhen<List<MeetingResponseModel>>(
      data: (list) => list,
      orElse: () => [],
    );
    final updated = [newMeeting, ...current];
    state = AsyncData(updated);
    _startPollingForProcessing(updated);
  }

  void _startPollingForProcessing(List<MeetingResponseModel> meetings) {
    for (final meeting in meetings) {
      final isProcessing =
          meeting.status.toUpperCase() == 'PROCESSING' ||
          meeting.status.toUpperCase() == 'AUDIO_UPLOADED';

      if (!isProcessing || _pollingTimers.containsKey(meeting.id)) continue;

      _pollingTimers[meeting.id] = Timer.periodic(
        const Duration(seconds: 5),
        (_) => _pollMeetingStatus(meeting.id),
      );
    }
  }

  Future<void> _pollMeetingStatus(String meetingId) async {
    try {
      print('🔄 Polling meeting: $meetingId');
      final controller = ref.read(meetingControllerProvider);
      final updated = await controller.getMeetingById(meetingId: meetingId);

      print('📋 Meeting $meetingId status: ${updated.status}');

      final isStillProcessing =
          updated.status.toUpperCase() == 'PROCESSING' ||
          updated.status.toUpperCase() == 'AUDIO_UPLOADED';

      if (!isStillProcessing) {
        print('✅ Done polling $meetingId — status: ${updated.status}');
        _pollingTimers[meetingId]?.cancel();
        _pollingTimers.remove(meetingId);
      }

      final current = state.maybeWhen<List<MeetingResponseModel>>(
        data: (list) => list,
        orElse: () => [],
      );
      final newList = current
          .map((m) => m.id == meetingId ? updated : m)
          .toList();
      state = AsyncData(newList);
    } catch (e, stack) {
      print('❌ Polling error for $meetingId: $e');
      print(stack);
    }
  }
}

final recentMeetingsProvider =
    AsyncNotifierProvider<RecentMeetingsNotifier, List<MeetingResponseModel>>(
      RecentMeetingsNotifier.new,
    );

// -----------------------------------------------------------
// All meetings provider — same polling logic
// -----------------------------------------------------------
class AllMeetingsNotifier extends AsyncNotifier<List<MeetingResponseModel>> {
  final Map<String, Timer> _pollingTimers = {};

  @override
  Future<List<MeetingResponseModel>> build() async {
    ref.onDispose(() {
      for (final timer in _pollingTimers.values) {
        timer.cancel();
      }
      _pollingTimers.clear();
    });

    final meetings = await _fetch();
    _startPollingForProcessing(meetings);
    return meetings;
  }

  Future<List<MeetingResponseModel>> _fetch() {
    final controller = ref.read(meetingControllerProvider);
    return controller.getAllMeetings();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final meetings = await _fetch();
      _startPollingForProcessing(meetings);
      return meetings;
    });
  }

  void addMeeting(MeetingResponseModel newMeeting) {
    // ✅ explicit typed cast
    final current = state.maybeWhen<List<MeetingResponseModel>>(
      data: (list) => list,
      orElse: () => [],
    );
    final updated = [newMeeting, ...current];
    state = AsyncData(updated);
    _startPollingForProcessing(updated);
  }

  void _startPollingForProcessing(List<MeetingResponseModel> meetings) {
    for (final meeting in meetings) {
      final isProcessing =
          meeting.status.toUpperCase() == 'PROCESSING' ||
          meeting.status.toUpperCase() == 'AUDIO_UPLOADED';

      if (!isProcessing || _pollingTimers.containsKey(meeting.id)) continue;

      _pollingTimers[meeting.id] = Timer.periodic(
        const Duration(seconds: 5),
        (_) => _pollMeetingStatus(meeting.id),
      );
    }
  }

  Future<void> _pollMeetingStatus(String meetingId) async {
    try {
      final controller = ref.read(meetingControllerProvider);
      final updated = await controller.getMeetingById(meetingId: meetingId);

      final isStillProcessing =
          updated.status.toUpperCase() == 'PROCESSING' ||
          updated.status.toUpperCase() == 'AUDIO_UPLOADED';

      if (!isStillProcessing) {
        _pollingTimers[meetingId]?.cancel();
        _pollingTimers.remove(meetingId);
      }

      // ✅ explicit typed cast
      final current = state.maybeWhen<List<MeetingResponseModel>>(
        data: (list) => list,
        orElse: () => [],
      );
      final newList = current
          .map((m) => m.id == meetingId ? updated : m)
          .toList();
      state = AsyncData(newList);
    } catch (_) {
      // Silently ignore polling errors
    }
  }
}

final allMeetingsProvider =
    AsyncNotifierProvider<AllMeetingsNotifier, List<MeetingResponseModel>>(
      AllMeetingsNotifier.new,
    );
