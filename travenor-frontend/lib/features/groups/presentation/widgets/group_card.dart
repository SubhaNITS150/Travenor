import 'package:flutter/material.dart';

class GroupCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final String destination;
  final int travelers;
  final String startsIn;
  final VoidCallback? onTap;

  const GroupCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.destination,
    required this.travelers,
    required this.startsIn,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 280,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .04),
              blurRadius: 15,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Top Section
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: .12),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Icon(
                    icon,
                    color: color,
                    size: 28,
                  ),
                ),
      
                const Spacer(),
      
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_horiz,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
      
            const SizedBox(height: 16),
      
            /// Title
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
      
            const SizedBox(height: 8),
      
            Text(
              subtitle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.grey,
                height: 1.4,
              ),
            ),
      
            const Spacer(),
      
            /// Destination
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  size: 18,
                  color: Colors.redAccent,
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    destination,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
      
            const SizedBox(height: 14),
      
            /// Bottom Row
            Row(
              children: [
                SizedBox(
                  width: 65,
                  child: Stack(
                    children: const [
                      CircleAvatar(
                        radius: 14,
                        backgroundImage:
                            NetworkImage("https://i.pravatar.cc/100?img=1"),
                      ),
                      Positioned(
                        left: 18,
                        child: CircleAvatar(
                          radius: 14,
                          backgroundImage:
                              NetworkImage("https://i.pravatar.cc/100?img=2"),
                        ),
                      ),
                      Positioned(
                        left: 36,
                        child: CircleAvatar(
                          radius: 14,
                          backgroundImage:
                              NetworkImage("https://i.pravatar.cc/100?img=3"),
                        ),
                      ),
                    ],
                  ),
                ),
      
                Text(
                  "$travelers travelers",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
      
                const Spacer(),
      
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: .12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    startsIn,
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
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