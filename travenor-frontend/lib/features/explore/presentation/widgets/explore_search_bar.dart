import 'package:flutter/material.dart';

class ExploreSearchBar extends StatelessWidget {
  const ExploreSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Container(
        height: 58,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.circular(18),
        ),
        child: const Row(
          children: [
            SizedBox(width: 16),

            Icon(Icons.search),

            SizedBox(width: 12),

            Expanded(
              child: Text(
                "Search tours, destinations...",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),

            Icon(
              Icons.tune,
              color: Color(0xFF6C63FF),
            ),

            SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}