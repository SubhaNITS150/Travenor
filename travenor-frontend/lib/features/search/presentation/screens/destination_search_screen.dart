import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:travenor/features/search/presentation/widgets/popular_destination.dart';
import 'package:travenor/features/search/presentation/widgets/recent_searches.dart';
import 'package:travenor/features/search/presentation/widgets/search_header.dart';
import 'package:travenor/features/search/presentation/widgets/search_suggestions.dart';

class DestinationSearchScreen extends StatelessWidget {
  const DestinationSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          /// Home Screen Screenshot / Content Behind

          Container(
            color: Colors.black.withValues(alpha: .25),
          ),

          /// Blur

          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 8,
              sigmaY: 8,
            ),
            child: Container(
              color: Colors.white.withValues(alpha: .08),
            ),
          ),

          SafeArea(
            child: Column(
              children: const [
                SearchHeader(),

                SizedBox(height: 20),

                RecentSearches(),

                Divider(),

                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SearchSuggestions(),
                        SizedBox(height: 20),
                        PopularDestinations(),
                        SizedBox(height: 50),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}