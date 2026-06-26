import 'package:flutter/material.dart';

class SearchSuggestions extends StatelessWidget {
  const SearchSuggestions({super.key});

  @override
  Widget build(BuildContext context) {
    final suggestions = [
      "goa beaches",
      "goa nightlife",
      "goa hotels",
      "north goa",
      "south goa",
    ];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: suggestions.map((s) {
          return ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            title: Text(
              s,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            trailing: const Icon(
              Icons.north_west,
              color: Colors.white,
            ),
          );
        }).toList(),
      ),
    );
  }
}