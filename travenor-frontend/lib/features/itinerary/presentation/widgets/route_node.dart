import 'package:flutter/material.dart';

class RouteNode extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isFirst;
  final bool isLast;
  final bool isActive;
  final bool showImage;
  final String? imageUrl;
  final VoidCallback? onTap;

  const RouteNode({
    super.key,
    required this.title,
    required this.subtitle,
    this.isFirst = false,
    this.isLast = false,
    this.isActive = true,
    this.showImage = false,
    this.imageUrl,
    this.onTap,
  });

  static const _purple = Color(0xff6C63FF);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Timeline column ──────────────────────────────
            SizedBox(
              width: 40,
              child: Column(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 14,
                    width: 2,
                    color: isFirst
                        ? Colors.transparent
                        : _purple.withValues(alpha: .28),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 350),
                    height: 22,
                    width: 22,
                    decoration: BoxDecoration(
                      color: isActive ? _purple : Colors.grey.shade400,
                      shape: BoxShape.circle,
                      boxShadow: [
                        if (isActive)
                          BoxShadow(
                            color: _purple.withValues(alpha: .28),
                            blurRadius: 10,
                          ),
                      ],
                    ),
                    child: const Icon(
                      Icons.check,
                      size: 13,
                      color: Colors.white,
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 56,
                    width: 2,
                    color: isLast
                        ? Colors.transparent
                        : _purple.withValues(alpha: .28),
                  ),
                ],
              ),
            ),

            // ── Card ─────────────────────────────────────────
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(13),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: _purple.withValues(alpha: .07)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: .04),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    if (showImage) ...[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: imageUrl == null
                            ? Container(
                                width: 68,
                                height: 68,
                                color: Colors.grey.shade200,
                                child: const Icon(Icons.image),
                              )
                            : Image.network(
                                imageUrl!,
                                width: 68,
                                height: 68,
                                fit: BoxFit.cover,
                              ),
                      ),
                      const SizedBox(width: 12),
                    ],
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: Color(0xff1E1B4B),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            subtitle,
                            style: const TextStyle(
                              color: Color(0xff9CA3AF),
                              fontSize: 12,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      height: 28,
                      width: 28,
                      decoration: BoxDecoration(
                        color: _purple.withValues(alpha: .08),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.chevron_right,
                        color: _purple,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
