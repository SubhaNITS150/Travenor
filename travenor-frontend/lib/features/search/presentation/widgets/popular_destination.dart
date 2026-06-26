import 'package:flutter/material.dart';
import 'destination_tile.dart';

class PopularDestinations extends StatelessWidget {
  const PopularDestinations({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Popular Destinations",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        SizedBox(height: 12),

        DestinationTile(
          title: "Goa",
          subtitle: "Beaches • Nightlife • Water Sports",
          image: "https://picsum.photos/200",
        ),

        DestinationTile(
          title: "Manali",
          subtitle: "Mountains • Adventure",
          image: "https://picsum.photos/201",
        ),

        DestinationTile(
          title: "Ladakh",
          subtitle: "Road Trips • Mountains",
          image: "https://picsum.photos/202",
        ),
      ],
    );
  }
}