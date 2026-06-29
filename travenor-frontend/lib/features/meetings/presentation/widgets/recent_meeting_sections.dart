import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travenor/features/meetanalysis/presentation/screens/meet_analysis_screen.dart';
import 'package:travenor/features/meetings/presentation/providers/meeting_provider.dart';
import 'package:travenor/features/meetings/presentation/widgets/meeting_tile.dart';

// Change StatefulWidget → ConsumerWidget (stateless, Riverpod handles state)
class RecentMeetingsSection extends ConsumerWidget {
  const RecentMeetingsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watches the provider — auto-rebuilds when meetings change
    final meetingsAsync = ref.watch(recentMeetingsProvider);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Recent Meetings",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: () {
                // TODO: Navigate to AllMeetingsScreen
              },
              child: const Text(
                "See all",
                style: TextStyle(color: Color(0xFF5B4CFF)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Switch on the 3 async states: loading / error / data
        meetingsAsync.when(
          loading: () => const Padding(
            padding: EdgeInsets.all(30),
            child: Center(child: CircularProgressIndicator()),
          ),
          error: (err, _) => Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              err.toString(),
              style: const TextStyle(color: Colors.red),
            ),
          ),
          data: (meetings) {
            if (meetings.isEmpty) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: Text("No meetings found."),
              );
            }

            return Column(
              children: meetings.map((meeting) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => MeetAnalysisScreen(meetingId: meeting.id),
                        ),
                      );
                    },
                    child: MeetingTile(meeting: meeting),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }
}