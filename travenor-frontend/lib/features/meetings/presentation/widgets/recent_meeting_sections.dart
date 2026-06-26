import 'package:flutter/material.dart';
import 'package:travenor/features/meetanalysis/presentation/screens/meet_analysis_screen.dart';
import 'package:travenor/features/meetings/presentation/widgets/meeting_model.dart';
import 'package:travenor/features/meetings/presentation/widgets/meeting_tile.dart';

class RecentMeetingsSection extends StatelessWidget {
  const RecentMeetingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final meetings = [
      MeetingModel(
        title: "Product Strategy Discussion",
        date: "24 May",
        duration: "45:18",
        size: "32 MB",
      ),
      MeetingModel(
        title: "Marketing Weekly Sync",
        date: "23 May",
        duration: "30:12",
        size: "24 MB",
      ),
      MeetingModel(
        title: "Client Review Meeting",
        date: "22 May",
        duration: "52:41",
        size: "48 MB",
      ),
    ];

    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Recent Meetings",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "See all",
              style: TextStyle(
                color: Color(0xFF5B4CFF),
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        ...meetings.map(
          (meeting) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const MeetAnalysisScreen(),
                  ),
                );
              },
              child: MeetingTile(
                meeting: meeting,
              ),
            ),
          ),
        ),
      ],
    );
  }
}