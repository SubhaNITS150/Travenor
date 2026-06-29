import 'package:flutter/material.dart';

class TripHeader extends StatelessWidget {
  final String tripTitle;
  final String duration;
  final VoidCallback? onBack;
  final VoidCallback? onShare;
  final VoidCallback? onDownload;

  const TripHeader({
    super.key,
    required this.tripTitle,
    required this.duration,
    this.onBack,
    this.onShare,
    this.onDownload,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _HeaderIconButton(
                icon: Icons.arrow_back_ios_new_rounded,
                onTap: onBack ?? () => Navigator.maybePop(context),
              ),
              const Spacer(),
              _HeaderIconButton(icon: Icons.share_outlined, onTap: onShare),
              const SizedBox(width: 12),
              _HeaderIconButton(icon: Icons.download_rounded, onTap: onDownload),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            tripTitle,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Color(0xff1E1B4B),
              letterSpacing: -.8,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Container(
                height: 8,
                width: 8,
                decoration: const BoxDecoration(
                  color: Color(0xff6C63FF),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                duration,
                style: const TextStyle(
                  color: Color(0xff6C63FF),
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeaderIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const _HeaderIconButton({required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      elevation: 2,
      shadowColor: Colors.black.withValues(alpha: .08),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: SizedBox(
          height: 52,
          width: 52,
          child: Icon(icon, color: const Color(0xff6C63FF), size: 22),
        ),
      ),
    );
  }
}