import 'package:flutter/material.dart';

class SelectionSummaryCard extends StatelessWidget {
  const SelectionSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xffF5F3FF),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceAround,
        children: const [
          _SummaryItem(
            icon: Icons.location_on,
            title: "3 Destinations",
            subtitle: "Manali, Jaipur",
          ),
          _SummaryItem(
            icon: Icons.calendar_month,
            title: "5 Days",
            subtitle: "4 Nights",
          ),
          _SummaryItem(
            icon: Icons.wallet,
            title: "Mixed",
            subtitle: "Budget",
          ),
          _SummaryItem(
            icon: Icons.hotel,
            title: "Semi Luxury",
            subtitle: "Hotel",
          ),
        ],
      ),
    );
  }
}

class _SummaryItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _SummaryItem({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: const Color(0xff7C3AED),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          subtitle,
          style: const TextStyle(
            color: Color(0xff64748B),
          ),
        ),
      ],
    );
  }
}