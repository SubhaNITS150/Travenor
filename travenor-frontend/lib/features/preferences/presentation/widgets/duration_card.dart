import 'package:flutter/material.dart';

class DurationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const DurationCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 120,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xffF5F3FF)
              : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? const Color(0xff7C3AED)
                : const Color(0xffE5E7EB),
            width: 2,
          ),
        ),
        child: Stack(
          children: [
            if (isSelected)
              const Positioned(
                top: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Color(0xff7C3AED),
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 12,
                  ),
                ),
              ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xffF3F4F6),
                  child: Icon(
                    icon,
                    color: const Color(0xff7C3AED),
                  ),
                ),

                const SizedBox(height: 12),

                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),

                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xff64748B),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}