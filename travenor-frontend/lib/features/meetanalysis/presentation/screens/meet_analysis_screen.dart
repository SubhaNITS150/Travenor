import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travenor/features/meetanalysis/presentation/providers/meet_analysis_provider.dart';
import 'package:travenor/features/meetanalysis/presentation/widgets/analysis_section.dart';
import 'package:travenor/features/meetanalysis/presentation/widgets/custom_tabbar.dart';
import 'package:travenor/features/meetanalysis/presentation/widgets/destination_card.dart';
import 'package:travenor/features/meetanalysis/presentation/widgets/meeting_header_card.dart';
import 'package:travenor/features/meetanalysis/presentation/widgets/next_step_tile.dart';
import 'package:travenor/features/meetanalysis/presentation/widgets/overview_card.dart';
import 'package:travenor/features/meetanalysis/presentation/widgets/preference_chip.dart';
import 'package:travenor/features/preferences/presentation/screens/preferences_screen.dart';

class MeetAnalysisScreen extends ConsumerWidget {
  final String meetingId;

  const MeetAnalysisScreen({super.key, required this.meetingId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final destinationsAsync = ref.watch(
      discussedDestinationsProvider(meetingId),
    );

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

              //---------------------------- Quick Overview ---------------------------//
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
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

              //---------------------------- Top Preferences --------------------------//
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
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
                            backgroundColor: const Color(0xFFEAF8EF),
                            textColor: const Color(0xFF2E8B57),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: PreferenceChip(
                            title: "Adventure Activities",
                            votes: 5,
                            backgroundColor: const Color(0xFFEEF2FF),
                            textColor: const Color(0xFF4F46E5),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: PreferenceChip(
                            title: "3-4 Days Duration",
                            votes: 4,
                            backgroundColor: const Color(0xFFF3E8FF),
                            textColor: const Color(0xFF9333EA),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: PreferenceChip(
                            title: "Budget: ₹8k-₹12k",
                            votes: 5,
                            backgroundColor: const Color(0xFFFFF4E5),
                            textColor: const Color(0xFFF59E0B),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              //---------------------------- Key Destinations -------------------------//
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Key Destinations Discussed",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
              ),
              const SizedBox(height: 12),
              destinationsAsync.when(
                loading: () => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (err, _) => const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Failed to load destinations.',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                data: (destinations) {
                  if (destinations.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text('No destinations discussed yet.'),
                    );
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SizedBox(
                      height: 160,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: destinations.length,
                        itemBuilder: (context, index) {
                          final dest = destinations[index];
                          return DestinationCard(
                            name: dest.name,
                            mentions: dest.mentionCount,
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),

              //---------------------------- Next Steps ------------------------------//
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
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
                        builder: (_) =>
                            PreferencesScreen(meetingId: meetingId), 
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: NextStepTile(
                  icon: Icons.edit_outlined,
                  title: "Customize preferences",
                  subtitle: "Adjust preferences for better recommendations",
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: NextStepTile(
                  icon: Icons.share,
                  title: "Share with group",
                  subtitle: "Share summary and recommendations",
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
