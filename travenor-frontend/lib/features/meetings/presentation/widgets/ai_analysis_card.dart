import 'package:flutter/material.dart';

class AIAnalysisCard extends StatelessWidget {
  const AIAnalysisCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.auto_awesome,
                color: Color(0xFF5B4CFF),
              ),
              SizedBox(width: 8),
              Text(
                "AI Meeting Analysis",
                style: TextStyle(
                  color: Color(0xFF5B4CFF),
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),

          const SizedBox(height: 20),

          const Text(
            "Upload meeting audio and get smart insights",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          const Text(
            "Transcription, summary, action items and key insights.",
          ),

          const SizedBox(height: 24),

          Center(
            child: Image.asset(
              "assets/images/gemini.png",
              height: 200,
            ),
          ),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.upload_file),
              label: const Text("Upload Audio"),
            ),
          ),
        ],
      ),
    );
  }
}