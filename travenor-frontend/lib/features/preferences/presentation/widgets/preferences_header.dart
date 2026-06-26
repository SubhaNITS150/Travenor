import 'package:flutter/material.dart';

class PreferencesHeader extends StatelessWidget {
  const PreferencesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top Bar
        Row(
          children: [
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: .05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 18,
                ),
              ),
            ),

            const Expanded(
              child: Center(
                child: Text(
                  "Recommended Tour Plans",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff111827),
                  ),
                ),
              ),
            ),

            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: .05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(
                Icons.auto_awesome,
                color: Color(0xff7C3AED),
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),

        // Progress Indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _progressLine(true),
            const SizedBox(width: 10),
            _progressLine(false),
            const SizedBox(width: 10),
            _progressLine(false),
          ],
        ),

        const SizedBox(height: 32),

        // Hero Content
        Stack(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                left: 8,
                right: 140,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 12.0),
                    child: Text(
                      "Customize Your Trip ✨",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff0F172A),
                        height: 1.1,
                      ),
                    ),
                  ),

                  SizedBox(height: 14),

                  Text(
                    "Select your preferences below to generate the best itinerary for your trip.",
                    style: TextStyle(
                      fontSize: 17,
                      color: Color(0xff64748B),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              right: 0,
              top: 0,
              child: SizedBox(
                height: 120,
                width: 140,
                child: Stack(
                  children: [
                    Positioned(
                      right: 10,
                      top: 0,
                      child: Icon(
                        Icons.air,
                        size: 70,
                        color: Colors.deepPurple.withValues(alpha: .12),
                      ),
                    ),

                    Positioned(
                      left: 0,
                      bottom: 0,
                      child: Icon(
                        Icons.landscape_rounded,
                        size: 90,
                        color: Colors.deepPurple.withValues(alpha: .18),
                      ),
                    ),

                    Positioned(
                      right: 20,
                      bottom: 10,
                      child: Icon(
                        Icons.flight_takeoff,
                        size: 32,
                        color: Color(0xff7C3AED),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  static Widget _progressLine(bool active) {
    return Container(
      width: 90,
      height: 5,
      decoration: BoxDecoration(
        color: active
            ? const Color(0xff7C3AED)
            : const Color(0xffE5E7EB),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}