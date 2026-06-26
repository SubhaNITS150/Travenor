import 'package:flutter/material.dart';

class GoogleMeetSection extends StatelessWidget {
  const GoogleMeetSection({super.key});

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
          Row(
            children: [
              const Icon(
                Icons.video_call,
                color: Colors.green,
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Text(
                  "Get Google Meet Records",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "Extension Required",
                ),
              )
            ],
          ),

          const SizedBox(height: 16),

          const Text(
            "Install the browser extension to automatically fetch meeting recordings from Google Meet.",
          ),

          const SizedBox(height: 20),

          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.extension),
            label: const Text("Install Extension"),
          )
        ],
      ),
    );
  }
}