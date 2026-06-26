import 'package:flutter/material.dart';

class GroupsSection extends StatelessWidget {
  const GroupsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          const Text(
            "Your Groups",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          SizedBox(
            height: 70,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (_, index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(right: 12),
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor:
                        Colors.blue.shade100,
                    child: Text(
                      "G${index + 1}",
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}