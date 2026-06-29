import 'package:flutter/material.dart';

class SecurityInfoCard extends StatelessWidget {
  const SecurityInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: const Color(0xffF8FAFC),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0xffE2E8F0),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 54,
            width: 54,
            decoration: BoxDecoration(
              color: const Color(0xffECFDF5),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.security_rounded,
              color: Color(0xff16A34A),
              size: 30,
            ),
          ),

          const SizedBox(width: 18),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Your Data is Secure",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff111827),
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Your meeting recording is encrypted during upload and processed securely. We never share your audio with third parties.",
                  style: TextStyle(
                    color: Color(0xff64748B),
                    height: 1.6,
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 18),

                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: const [
                    _SecurityChip(
                      icon: Icons.lock_outline,
                      text: "Encrypted",
                    ),
                    _SecurityChip(
                      icon: Icons.cloud_done_outlined,
                      text: "Secure Upload",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SecurityChip extends StatelessWidget {
  final IconData icon;
  final String text;

  const _SecurityChip({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: const Color(0xffD1FAE5),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: const Color(0xff16A34A),
            size: 18,
          ),

          const SizedBox(width: 6),

          Flexible(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color(0xff16A34A),
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}