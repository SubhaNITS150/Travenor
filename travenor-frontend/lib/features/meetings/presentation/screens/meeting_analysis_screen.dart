import 'package:flutter/material.dart';
import 'package:travenor/features/meetings/presentation/widgets/ai_analysis_card.dart';
import 'package:travenor/features/meetings/presentation/widgets/google_meeting_section.dart';
import 'package:travenor/features/meetings/presentation/widgets/meeting_analysis_header.dart';
import 'package:travenor/features/meetings/presentation/widgets/recent_meeting_sections.dart';

class MeetingAnalysisScreen extends StatelessWidget {
  const MeetingAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FD),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              MeetingAnalysisHeader(),

              SizedBox(height: 20),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: AIAnalysisCard(),
              ),

              SizedBox(height: 24),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: RecentMeetingsSection(),
              ),

              SizedBox(height: 24),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: GoogleMeetSection(),
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
