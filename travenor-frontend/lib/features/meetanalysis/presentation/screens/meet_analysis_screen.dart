import 'package:flutter/material.dart';
import 'package:travenor/features/meetanalysis/presentation/widgets/analysis_section.dart';
import 'package:travenor/features/meetanalysis/presentation/widgets/custom_tabbar.dart';
import 'package:travenor/features/meetanalysis/presentation/widgets/destination_card.dart';
import 'package:travenor/features/meetanalysis/presentation/widgets/meeting_header_card.dart';
import 'package:travenor/features/meetanalysis/presentation/widgets/next_step_tile.dart';
import 'package:travenor/features/meetanalysis/presentation/widgets/overview_card.dart';
import 'package:travenor/features/meetanalysis/presentation/widgets/preference_chip.dart';
import 'package:travenor/features/preferences/presentation/screens/preferences_screen.dart';

class MeetAnalysisScreen extends StatelessWidget {
  const MeetAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FB),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MeetingHeaderCard(),
              const SizedBox(height: 20),
              const CustomTabBar(),
              const SizedBox(height: 20),
              const AnalysisSection(),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: const Text(
                  "Quick Overview",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 1.4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: const [
                    OverviewCard(
                      icon: Icons.group_outlined,
                      title: "6",
                      subtitle: "Participants",
                      color: Color(0xff8B5CF6),
                    ),
                    OverviewCard(
                      icon: Icons.chat_bubble_outline,
                      title: "32",
                      subtitle: "Suggestions",
                      color: Color(0xff10B981),
                    ),
                    OverviewCard(
                      icon: Icons.thumb_up_alt_outlined,
                      title: "7",
                      subtitle: "Top Preferences",
                      color: Color(0xffF59E0B),
                    ),
                    OverviewCard(
                      icon: Icons.access_time,
                      title: "58 min",
                      subtitle: "Duration",
                      color: Color(0xff3B82F6),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: const Text(
                  "Top Preferences",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 4.0,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: PreferenceChip(
                            title: "Mountains",
                            votes: 4,
                            backgroundColor: Color(0xFFEAF8EF),
                            textColor: Color(0xFF2E8B57),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: PreferenceChip(
                            title: "Adventure Activities",
                            votes: 5,
                            backgroundColor: Color(0xFFEEF2FF),
                            textColor: Color(0xFF4F46E5),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: PreferenceChip(
                            title: "3-4 Days Duration",
                            votes: 4,
                            backgroundColor: Color(0xFFF3E8FF),
                            textColor: Color(0xFF9333EA),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: PreferenceChip(
                            title: "Budget: ₹8k-₹12k",
                            votes: 5,
                            backgroundColor: Color(0xFFFFF4E5),
                            textColor: Color(0xFFF59E0B),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: const Text(
                  "Key Destinations Discussed",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(
                  height: 160,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      DestinationCard(name: "Manali", mentions: 5),
                      DestinationCard(name: "Shillong", mentions: 4),
                      DestinationCard(name: "Kasol", mentions: 3),
                      DestinationCard(name: "Auli", mentions: 2),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: const Text(
                  "Next Steps",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: NextStepTile(
                  icon: Icons.check_circle,
                  title: "Review recommended tour plans",
                  subtitle: "Based on discussion preferences",
                  color: Colors.green,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const PreferencesScreen(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: const NextStepTile(
                  icon: Icons.edit_outlined,
                  title: "Customize preferences",
                  subtitle: "Adjust preferences for better recommendations",
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: const NextStepTile(
                  icon: Icons.share,
                  title: "Share with group",
                  subtitle: "Share summary and recommendations",
                  color: Colors.deepPurple,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
