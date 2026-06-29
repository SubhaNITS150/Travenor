import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travenor/features/meetanalysis/data/models/discussed_destination_model.dart';
import 'package:travenor/features/meetings/presentation/providers/meeting_provider.dart';

final discussedDestinationsProvider =
    FutureProvider.family<List<DiscussedDestinationModel>, String>(
  (ref, meetingId) async {
    final controller = ref.read(meetingControllerProvider);
    return controller.getDiscussedDestinations(meetingId: meetingId);
  },
);