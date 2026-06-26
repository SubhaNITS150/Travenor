import 'package:flutter/material.dart';

class PlacesYouMayLikeSection extends StatelessWidget {
  const PlacesYouMayLikeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final places = [
      Place(
        name: "Goa",
        image:
            "https://images.unsplash.com/photo-1512343879784-a960bf40e7f2",
      ),
      Place(
        name: "Bali",
        image:
            "https://images.unsplash.com/photo-1537953773345-d172ccf13cf1",
      ),
      Place(
        name: "Paris",
        image:
            "https://images.unsplash.com/photo-1431274172761-fca41d930114",
      ),
      Place(
        name: "Dubai",
        image:
            "https://images.unsplash.com/photo-1512453979798-5ea266f8880c",
      ),
      Place(
        name: "Tokyo",
        image:
            "https://images.unsplash.com/photo-1540959733332-eab4deabeeaf",
      ),
      Place(
        name: "Tokyo",
        image:
            "https://images.unsplash.com/photo-1540959733332-eab4deabeeaf",
      ),
    ];

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 12,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.05),
                blurRadius: 10,
              ),
            ],
          ),
          child: const Center(
            child: Text(
              "Places You May Like",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),

        SizedBox(
          height: 100,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: places.length,
            separatorBuilder: (_, __) =>
                const SizedBox(width: 14),
            itemBuilder: (context, index) {
              final place = places[index];

              return Column(
                children: [
                  Container(
                    width: 65,
                    height: 65,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.blue.shade100,
                        width: 2,
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundImage:
                          NetworkImage(place.image),
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    place.name,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class Place {
  final String name;
  final String image;

  Place({
    required this.name,
    required this.image,
  });
}