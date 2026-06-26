import 'package:flutter/material.dart';
import 'package:travenor/features/explore/presentation/widgets/category_chips.dart';
import 'package:travenor/features/explore/presentation/widgets/explore_header.dart';
import 'package:travenor/features/explore/presentation/widgets/explore_search_bar.dart';
import 'package:travenor/features/explore/presentation/widgets/generated_tours_section.dart';
import 'package:travenor/features/explore/presentation/widgets/saved_tour_sections.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FD),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              ExploreHeader(),

              SizedBox(height: 20),

              ExploreSearchBar(),

              SizedBox(height: 20),

              CategoryChips(),

              SizedBox(height: 24),

              GeneratedToursSection(),

              SizedBox(height: 24),

              SavedToursSection(),

              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}