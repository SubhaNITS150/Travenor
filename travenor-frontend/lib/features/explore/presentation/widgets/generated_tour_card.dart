import 'package:flutter/material.dart';

class GeneratedTourCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String duration;
  final String destinations;
  final String price;
  final int travelers;
  final VoidCallback? onTap;

  const GeneratedTourCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.destinations,
    required this.price,
    required this.travelers,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 260,
        height: 360,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// IMAGE
            Stack(
              children: [
                Image.network(
                  imageUrl,
                  width: 260,
                  height: 180,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    width: 260,
                    height: 180,
                    color: Colors.grey.shade300,
                    child: const Center(
                      child: Icon(Icons.image, size: 40, color: Colors.grey),
                    ),
                  ),
                ),

                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      duration,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: .95),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.favorite_border, size: 20),
                  ),
                ),
              ],
            ),

            /// CONTENT
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      destinations,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.grey, height: 1.4),
                    ),

                    const Spacer(),

                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: price,
                            style: const TextStyle(
                              color: Color(0xFF6C63FF),
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const TextSpan(
                            text: " / person",
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    Row(
                      children: [
                        SizedBox(
                          width: 90,
                          height: 28,
                          child: Stack(
                            children: [
                              _avatar(0, "https://i.pravatar.cc/150?img=1"),
                              _avatar(20, "https://i.pravatar.cc/150?img=2"),
                              _avatar(40, "https://i.pravatar.cc/150?img=3"),
                              _avatar(60, "https://i.pravatar.cc/150?img=4"),
                            ],
                          ),
                        ),

                        const Spacer(),

                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF4F4FF),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "$travelers Travelers",
                            style: const TextStyle(
                              color: Color(0xFF6C63FF),
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _avatar(double left, String image) {
    return Positioned(
      left: left,
      child: CircleAvatar(
        radius: 14,
        backgroundColor: Colors.white,
        child: CircleAvatar(radius: 12, backgroundImage: NetworkImage(image)),
      ),
    );
  }
}
