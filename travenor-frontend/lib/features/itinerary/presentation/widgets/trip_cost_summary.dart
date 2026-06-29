// ─────────────────────────────────────────────────────────────
//  itinerary/presentation/widgets/trip_cost_summary.dart
// ─────────────────────────────────────────────────────────────
import 'package:flutter/material.dart';

class TripCostSummary extends StatelessWidget {
  final String estimatedCost;
  final VoidCallback? onViewBreakdown;

  const TripCostSummary({
    super.key,
    required this.estimatedCost,
    this.onViewBreakdown,
  });

  static const _purple = Color(0xff6C63FF);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .05),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 52,
            width: 52,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xff6C63FF), Color(0xffA78BFA)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.receipt_long_rounded,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Trip Cost Summary',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xff6B7280),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                const Text(
                  'Your Estimated Cost',
                  style: TextStyle(
                    fontSize: 11,
                    color: Color(0xff9CA3AF),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  estimatedCost,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                    color: Color(0xff1E1B4B),
                    letterSpacing: -0.5,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onViewBreakdown,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xffEEF2FF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'View Breakdown ↗',
                style: TextStyle(
                  color: _purple,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}