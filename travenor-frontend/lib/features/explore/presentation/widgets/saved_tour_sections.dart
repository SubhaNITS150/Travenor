import 'package:flutter/material.dart';
import 'package:travenor/core/constants/app_color.dart';
import 'package:travenor/features/explore/presentation/widgets/saved_tour_tile.dart';

class SavedToursSection
    extends StatelessWidget {
  const SavedToursSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius:
                      BorderRadius.circular(
                    12,
                  ),
                ),
                child: const Icon(
                  Icons.bookmark,
                  color: Colors.green,
                ),
              ),

              const SizedBox(width: 12),

              const Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Saved Tours",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight:
                            FontWeight.bold,
                        color: AppColor.headTextBlack
                      ),
                    ),
                    Text(
                      "Your saved & customized tours",
                      style: TextStyle(
                        color: AppColor.paragraphTextBlack,
                      ),
                    ),
                  ],
                ),
              ),

              TextButton(
                onPressed: () {},
                child: const Text(
                  "See all",
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          SavedTourTile(
            imageUrl:
                "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee",
            title:
                "Spiti Valley Road Trip",
            subtitle:
                "6 Days • 5 Nights • 7 Travelers",
            updatedAt:
                "Last updated on 12 Jul 2025",
            status: "Completed",
          ),

          SavedTourTile(
            imageUrl:
                "https://images.unsplash.com/photo-1524492412937-b28074a5d7da",
            title:
                "Rajasthan Heritage Tour",
            subtitle:
                "7 Days • 6 Nights • 6 Travelers",
            updatedAt:
                "Last updated on 09 Jul 2025",
            status: "In Progress",
          ),

          SavedTourTile(
            imageUrl:
                "https://images.unsplash.com/photo-1507525428034-b723cf961d3e",
            title: "Andaman Escape",
            subtitle:
                "5 Days • 4 Nights • 4 Travelers",
            updatedAt:
                "Last updated on 06 Jul 2025",
            status: "Planning",
          ),
        ],
      ),
    );
  }
}