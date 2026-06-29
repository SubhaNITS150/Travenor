import 'package:flutter/material.dart';
import 'package:travenor/features/itinerary/presentation/screens/itinerary_screen.dart';
import 'package:travenor/features/preferences/presentation/widgets/destination_selection_section.dart';
import 'package:travenor/features/preferences/presentation/widgets/duration_selection_section.dart';
import 'package:travenor/features/preferences/presentation/widgets/generate_itenary_button.dart';
import 'package:travenor/features/preferences/presentation/widgets/preference_section.dart';
import 'package:travenor/features/preferences/presentation/widgets/preferences_header.dart';

class PreferencesScreen extends StatelessWidget {
  final String meetingId;
  const PreferencesScreen({super.key, required this.meetingId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7FF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              const PreferencesHeader(),
              const SizedBox(height: 24),

              // ✅ pass meetingId down
              DestinationSelectionSection(meetingId: meetingId),

              const SizedBox(height: 20),
              const DurationSelectionSection(),
              const SizedBox(height: 20),
              const PreferenceSection(
                sectionNumber: "3",
                title: "Travel Budget Preference",
                description: "Choose your budget style for this trip.",
                options: ["Economy", "Mixed", "Luxury"],
              ),
              const SizedBox(height: 20),
              const PreferenceSection(
                sectionNumber: "4",
                title: "Hotel Preference",
                description: "Choose your preferred hotel category.",
                options: ["Economy", "Semi Luxury", "Luxury"],
              ),
              const SizedBox(height: 20),
              GenerateItineraryButton(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 500),
                      reverseTransitionDuration: const Duration(
                        milliseconds: 400,
                      ),
                      pageBuilder: (_, __, ___) => const ItineraryScreen(),
                      transitionsBuilder: (_, animation, __, child) {
                        final slide =
                            Tween<Offset>(
                              begin: const Offset(0, 1),
                              end: Offset.zero,
                            ).animate(
                              CurvedAnimation(
                                parent: animation,
                                curve: Curves.easeOutCubic,
                              ),
                            );
                        final fade = CurvedAnimation(
                          parent: animation,
                          curve: Curves.easeIn,
                        );
                        return FadeTransition(
                          opacity: fade,
                          child: SlideTransition(position: slide, child: child),
                        );
                      },
                    ),
                  );
                },
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
