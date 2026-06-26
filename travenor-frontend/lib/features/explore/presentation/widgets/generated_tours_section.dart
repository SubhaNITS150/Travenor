import 'package:flutter/material.dart';
import 'package:travenor/features/explore/data/dummy/dummy_generated_tours.dart';
import 'package:travenor/features/explore/presentation/widgets/generated_tour_card.dart';

class GeneratedToursSection extends StatelessWidget {
  const GeneratedToursSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration:
                    BoxDecoration(
                  color:
                      const Color(
                    0xFFF1EDFF,
                  ),
                  borderRadius:
                      BorderRadius.circular(
                    14,
                  ),
                ),
                child: const Icon(
                  Icons.auto_awesome,
                  color:
                      Color(
                    0xFF6C63FF,
                  ),
                ),
              ),

              const SizedBox(width: 12),

              const Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Previously Generated Tours",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    Text(
                      "AI crafted tours, ready for you",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              TextButton(
                onPressed: () {},
                child: const Text(
                  "See all",
                  style: TextStyle(
                    color: Color(
                      0xFF6C63FF,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 18),

        SizedBox(
          height: 370,
          child: ListView.separated(
            padding:
                const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            scrollDirection:
                Axis.horizontal,
            itemCount:
                dummyGeneratedTours.length,
            separatorBuilder:
                (_, __) =>
                    const SizedBox(
                      width: 16,
                    ),
            itemBuilder:
                (context, index) {
              final tour =
                  dummyGeneratedTours[
                      index];

              return GeneratedTourCard(
                title: tour.title,
                imageUrl:
                    tour.imageUrl,
                duration:
                    tour.duration,
                destinations:
                    tour.destinations,
                price:
                    tour.price,
                travelers:
                    tour.travelers,

                onTap: () {
                  /// Navigate to
                  /// TourCustomizationScreen
                },
              );
            },
          ),
        ),
      ],
    );
  }
}