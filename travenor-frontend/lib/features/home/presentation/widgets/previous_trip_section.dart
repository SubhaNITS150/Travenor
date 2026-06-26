import 'package:flutter/material.dart';

class PreviousTripsSection extends StatelessWidget {
  const PreviousTripsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                "Previous Trips",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const Spacer(),

              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(20),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "See More",
                        style: TextStyle(
                          color: Colors.blue.shade600,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 12,
                        color: Colors.blue.shade600,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          _tripTile(
            image:
                "https://images.unsplash.com/photo-1512453979798-5ea266f8880c",
            title: "Bali Escape",
            date: "12 Jan - 18 Jan",
          ),

          const Divider(),

          _tripTile(
            image:
                "https://images.unsplash.com/photo-1494526585095-c41746248156",
            title: "Paris Tour",
            date: "3 Mar - 9 Mar",
          ),
        ],
      ),
    );
  }

  Widget _tripTile({
    required String image,
    required String title,
    required String date,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(image, width: 60, height: 60, fit: BoxFit.cover),
      ),
      title: Text(title),
      subtitle: Text(date),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}
