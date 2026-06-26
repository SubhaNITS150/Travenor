import 'package:flutter/material.dart';
import 'package:travenor/core/constants/app_color.dart';

class SavedTourTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String updatedAt;
  final String status;
  final VoidCallback? onTap;

  const SavedTourTile({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.updatedAt,
    required this.status,
    this.onTap,
  });

  Color _statusColor() {
    switch (status) {
      case "Completed":
        return Colors.white;

      case "Planning":
        return Colors.white;

      default:
        return const Color(0xFF6C63FF);
    }
  }

  Color _statusBg() {
    switch (status) {
      case "Completed":
        return Colors.green;

      case "Planning":
        return Colors.blue;

      default:
        return const Color(0xFFF1EDFF);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 14,
        ),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(
                alpha: .03,
              ),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius:
                  BorderRadius.circular(14),
              child: Image.network(
                imageUrl,
                width: 72,
                height: 72,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow:
                        TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight:
                          FontWeight.w700,
                      color: AppColor.headTextBlack
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    updatedAt,
                    style: const TextStyle(
                      color: AppColor.paragraphTextBlack,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            Column(
              crossAxisAlignment:
                  CrossAxisAlignment.end,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: _statusBg(),
                    borderRadius:
                        BorderRadius.circular(
                      20,
                    ),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      color: _statusColor(),
                      fontSize: 12,
                      fontWeight:
                          FontWeight.w600,
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                const Icon(
                  Icons.more_vert,
                  size: 20,
                  color: AppColor.paragraphTextBlack,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}