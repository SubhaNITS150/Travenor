import 'package:flutter/material.dart';
import 'package:travenor/features/preferences/presentation/widgets/destination_selection_section.dart';
import 'package:travenor/features/preferences/presentation/widgets/duration_selection_section.dart';
import 'package:travenor/features/preferences/presentation/widgets/generate_itenary_button.dart';
import 'package:travenor/features/preferences/presentation/widgets/preference_section.dart';
import 'package:travenor/features/preferences/presentation/widgets/preferences_header.dart';
import 'package:travenor/features/preferences/presentation/widgets/selection_summary_card.dart';

class PreferencesScreen extends StatelessWidget {
  const PreferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7FF),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          child: Column(
            children: [
              const PreferencesHeader(),

              const SizedBox(height: 24),

              const DestinationSelectionSection(),

              const SizedBox(height: 20),

              const DurationSelectionSection(),

              const SizedBox(height: 20),

              const PreferenceSection(
                sectionNumber: "3",
                title: "Travel Budget Preference",
                description:
                    "Choose your budget style for this trip.",
                options: [
                  "Economy",
                  "Mixed",
                  "Luxury",
                ],
              ),

              const SizedBox(height: 20),

              const PreferenceSection(
                sectionNumber: "4",
                title: "Hotel Preference",
                description:
                    "Choose your preferred hotel category.",
                options: [
                  "Economy",
                  "Semi Luxury",
                  "Luxury",
                ],
              ),

              const SizedBox(height: 20),

              // const SelectionSummaryCard(),

              // const SizedBox(height: 24),

              GenerateItineraryButton(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Generate itinerary clicked',
                      ),
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