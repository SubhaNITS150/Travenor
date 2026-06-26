import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final tabs = [
      "Summary",
      "Key Points",
      "Preferences",
      "Recommendations",
      "Transcript"
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: SizedBox(
        height: 40,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return Column(
              children: [
                Text(
                  tabs[index],
                  style: TextStyle(
                    color: index == 0
                        ? Colors.deepPurple
                        : Colors.black54,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                if (index == 0)
                  Container(
                    width: 60,
                    height: 3,
                    color: Colors.deepPurple,
                  )
              ],
            );
          },
          separatorBuilder: (_, __) =>
              const SizedBox(width: 20),
          itemCount: tabs.length,
        ),
      ),
    );
  }
}