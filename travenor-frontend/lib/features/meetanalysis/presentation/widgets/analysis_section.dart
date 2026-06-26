import 'package:flutter/material.dart';

class AnalysisSection extends StatelessWidget {
  const AnalysisSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xffF4F0FF),
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.auto_awesome,
                  color: Colors.deepPurple,
                ),
                SizedBox(width: 8),
                Text(
                  "AI Summary",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
            SizedBox(height: 12),
            Text(
              "The team discussed various weekend trip options and narrowed down preferences based on budget, duration and activities.",
            )
          ],
        ),
      ),
    );
  }
}