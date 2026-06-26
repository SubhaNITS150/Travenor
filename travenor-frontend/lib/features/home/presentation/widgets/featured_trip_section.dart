import 'package:flutter/material.dart';
import 'package:travenor/features/home/presentation/widgets/featured_trip_card.dart';

class FeaturedTripsSection extends StatelessWidget {
  const FeaturedTripsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.fromLTRB(20, 25, 20, 15),
          child: Row(
            children: [
              const Text(
                "Featured Trips",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Spacer(),

              TextButton(
                onPressed: () {},
                child: const Text("See All"),
              ),
            ],
          ),
        ),

        SizedBox(
          height: 260,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              FeaturedTripCard(
                image:
                    "https://images.unsplash.com/photo-1506744038136-46273834b3fb",
                title: "Swiss Alps",
                location: "Switzerland",
              ),

              FeaturedTripCard(
                image:
                    "https://images.unsplash.com/photo-1537996194471-e657df975ab4",
                title: "Bali Escape",
                location: "Indonesia",
              ),

              FeaturedTripCard(
                image:
                    "https://images.unsplash.com/photo-1537996194471-e657df975ab4",
                title: "Bali Escape",
                location: "Indonesia",
              ),

              FeaturedTripCard(
                image:
                    "https://images.unsplash.com/photo-1537996194471-e657df975ab4",
                title: "Bali Escape",
                location: "Indonesia",
              ),
              SizedBox(width: 20),
            ],
          ),
        ),
      ],
    );
  }
}