import 'package:flutter/material.dart';
import 'package:travenor/features/preferences/presentation/widgets/destination_card.dart';

class DestinationSelectionSection extends StatefulWidget {
  const DestinationSelectionSection({super.key});

  @override
  State<DestinationSelectionSection> createState() =>
      _DestinationSelectionSectionState();
}

class _DestinationSelectionSectionState
    extends State<DestinationSelectionSection> {
  final List<Map<String, dynamic>> destinations = [
    {
      "name": "Manali",
      "image":
          "https://images.unsplash.com/photo-1626621341517-bbf3d9990a23"
    },
    {
      "name": "Delhi",
      "image":
          "https://images.unsplash.com/photo-1587474260584-136574528ed5"
    },
    {
      "name": "Coimbatore",
      "image":
          "https://images.unsplash.com/photo-1599661046289-e31897846e41"
    },
    {
      "name": "Jaipur",
      "image":
          "https://images.unsplash.com/photo-1477587458883-47145ed94245"
    },
    {
      "name": "Himachal Pradesh",
      "image":
          "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee"
    },
  ];

  final Set<int> selectedIndexes = {
    0,
    3,
    4,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: const BoxDecoration(
                  color: Color(0xff7C3AED),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    "1",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 14),

              const Expanded(
                child: Text(
                  "Select Destinations",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color(0xffF5F3FF),
                  border: Border.all(
                    color: const Color(0xffC4B5FD),
                  ),
                ),
                child: Text(
                  "${selectedIndexes.length} Selected",
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xff7C3AED),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),

          const SizedBox(height: 12),

          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Choose the destinations you want to include in your itinerary.",
              style: TextStyle(
                color: Color(0xff64748B),
                fontSize: 15,
              ),
            ),
          ),

          const SizedBox(height: 20),

          SizedBox(
            height: 260,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: destinations.length,
              separatorBuilder: (_, __) =>
                  const SizedBox(width: 16),
              itemBuilder: (context, index) {
                return DestinationCard(
                  title: destinations[index]["name"],
                  imageUrl: destinations[index]["image"],
                  isSelected:
                      selectedIndexes.contains(index),
                  onTap: () {
                    setState(() {
                      if (selectedIndexes.contains(index)) {
                        selectedIndexes.remove(index);
                      } else {
                        selectedIndexes.add(index);
                      }
                    });
                  },
                );
              },
            ),
          ),

          const SizedBox(height: 18),

          Container(
            width: 120,
            height: 6,
            decoration: BoxDecoration(
              color: const Color(0xffE5E7EB),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 42,
                decoration: BoxDecoration(
                  color: const Color(0xff7C3AED),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}