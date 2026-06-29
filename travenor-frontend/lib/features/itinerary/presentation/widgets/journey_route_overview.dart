import 'package:flutter/material.dart';

class JourneyRouteOverview extends StatelessWidget {
  final VoidCallback onExpand;

  const JourneyRouteOverview({super.key, required this.onExpand});

  static const _purple = Color(0xff6C63FF);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onExpand,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: const Color(0xffEDE9FE), width: 1.5),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff6C63FF).withValues(alpha: .08),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          children: [
            // Gradient accent bar
            Container(
              width: 4,
              height: 50,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xff6C63FF), Color(0xffA78BFA)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(width: 14),

            // Icon bubble
            Container(
              height: 46,
              width: 46,
              decoration: BoxDecoration(
                color: const Color(0xffEEF2FF),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(Icons.route_rounded, color: _purple, size: 22),
            ),
            const SizedBox(width: 14),

            // Label
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Journey Route Overview',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff1E1B4B),
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'Tap to explore complete itinerary',
                    style: TextStyle(color: Color(0xff9CA3AF), fontSize: 12),
                  ),
                ],
              ),
            ),

            // Animated chevron container
            Container(
              height: 34,
              width: 34,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xff6C63FF), Color(0xffA78BFA)],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.chevron_right_rounded,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}