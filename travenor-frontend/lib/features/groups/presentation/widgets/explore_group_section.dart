import 'package:flutter/material.dart';
import 'explore_group_tile.dart';

class ExploreGroupsSection extends StatelessWidget {
  const ExploreGroupsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Explore Groups",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "View all",
              style: TextStyle(
                color: Color(0xFF5B4CFF),
              ),
            ),
          ],
        ),

        SizedBox(height: 16),

        ExploreGroupTile(
          title: "AI & Machine Learning",
          members: "128 members",
        ),

        ExploreGroupTile(
          title: "Startup Founders",
          members: "96 members",
        ),
      ],
    );
  }
}