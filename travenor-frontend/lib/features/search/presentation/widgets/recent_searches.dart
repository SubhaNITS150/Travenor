import 'package:flutter/material.dart';
import 'recent_search_chip.dart';

class RecentSearches extends StatelessWidget {
  const RecentSearches({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recent Searches",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Clear all",
                style: TextStyle(
                  color: Colors.deepPurpleAccent,
                ),
              )
            ],
          ),

          const SizedBox(height: 12),

          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: const [
              RecentSearchChip(text: "Goa"),
              RecentSearchChip(text: "Manali"),
              RecentSearchChip(text: "Thailand"),
              RecentSearchChip(text: "Ladakh"),
            ],
          ),
        ],
      ),
    );
  }
}