import 'package:flutter/material.dart';

class StatsCard extends StatelessWidget {
  final int destinations;
  final int hotels;
  final String totalCost;

  const StatsCard({
    super.key,
    required this.destinations,
    required this.hotels,
    required this.totalCost,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .05),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: _StatItem(
                icon: Icons.location_on_outlined,
                iconColor: const Color(0xff6C63FF),
                value: '$destinations',
                label: 'Destinations',
              ),
            ),
            VerticalDivider(color: Colors.grey.shade200, thickness: 1),
            Expanded(
              child: _StatItem(
                icon: Icons.hotel_outlined,
                iconColor: const Color(0xff8B5CF6),
                value: '$hotels',
                label: 'Hotels',
              ),
            ),
            VerticalDivider(color: Colors.grey.shade200, thickness: 1),
            Expanded(
              child: _StatItem(
                icon: Icons.account_balance_wallet_outlined,
                iconColor: const Color(0xff7C3AED),
                value: totalCost,
                label: 'Est. Cost',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String value;
  final String label;

  const _StatItem({
    required this.icon,
    required this.iconColor,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 46,
          width: 46,
          decoration: BoxDecoration(
            color: iconColor.withValues(alpha: .08),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: iconColor, size: 22),
        ),
        const SizedBox(height: 12),
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: Color(0xff111827),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Color(0xff6B7280), fontSize: 13),
        ),
      ],
    );
  }
}