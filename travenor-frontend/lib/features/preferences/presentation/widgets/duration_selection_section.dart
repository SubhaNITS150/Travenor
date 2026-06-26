import 'package:flutter/material.dart';
import 'package:travenor/features/preferences/presentation/widgets/duration_card.dart';

class DurationSelectionSection extends StatefulWidget {
  const DurationSelectionSection({super.key});

  @override
  State<DurationSelectionSection> createState() =>
      _DurationSelectionSectionState();
}

class _DurationSelectionSectionState
    extends State<DurationSelectionSection> {
  int selectedIndex = 2;

  final durations = [
    {
      "title": "2 Days",
      "subtitle": "1 Night",
      "icon": Icons.wb_sunny_outlined,
    },
    {
      "title": "3 Days",
      "subtitle": "2 Nights",
      "icon": Icons.landscape,
    },
    {
      "title": "5 Days",
      "subtitle": "4 Nights",
      "icon": Icons.terrain,
    },
    {
      "title": "7 Days",
      "subtitle": "6 Nights",
      "icon": Icons.forest,
    },
    {
      "title": "10 Days",
      "subtitle": "9 Nights",
      "icon": Icons.beach_access,
    },
  ];

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
              _sectionNumber("2"),
              const SizedBox(width: 14),
              const Expanded(
                child: Text(
                  "Trip Duration",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Select the number of days for your trip.",
              style: TextStyle(
                color: Color(0xff64748B),
              ),
            ),
          ),

          const SizedBox(height: 20),

          SizedBox(
            height: 150,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: durations.length,
              separatorBuilder: (_, __) =>
                  const SizedBox(width: 12),
              itemBuilder: (_, index) {
                return DurationCard(
                  title: durations[index]["title"] as String,
                  subtitle:
                      durations[index]["subtitle"] as String,
                  icon: durations[index]["icon"] as IconData,
                  isSelected: selectedIndex == index,
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionNumber(String value) {
    return CircleAvatar(
      radius: 16,
      backgroundColor: const Color(0xff7C3AED),
      child: Text(
        value,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}