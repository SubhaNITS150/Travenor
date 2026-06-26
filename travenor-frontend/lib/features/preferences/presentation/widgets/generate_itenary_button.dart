import 'package:flutter/material.dart';

class GenerateItineraryButton extends StatelessWidget {
  final VoidCallback onTap;

  const GenerateItineraryButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          gradient: const LinearGradient(
            colors: [
              Color(0xff6C63FF),
              Color(0xffD946EF),
            ],
          ),
        ),
        child: const Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            Text(
              "✨ Generate Best Itinerary",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 4),
            Text(
              "Get the perfect itinerary based on your preferences",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14
              ),
            ),
          ],
        ),
      ),
    );
  }
}