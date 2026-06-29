import 'package:flutter/material.dart';
import 'package:travenor/features/itinerary/data/itinerary_data.dart';

class DayCard extends StatelessWidget {
  final DayItinerary day;
  final bool isLast;

  const DayCard({super.key, required this.day, this.isLast = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Day header row ────────────────────────────────
        Row(
          children: [
            // Gradient day bubble
            Container(
              height: 38,
              width: 38,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff6C63FF), Color(0xffA78BFA)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '${day.dayNumber}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          '${day.from} to ${day.to}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: Color(0xff1E1B4B),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(day.emoji, style: const TextStyle(fontSize: 14)),
                    ],
                  ),
                  if (day.timeRange.isNotEmpty)
                    Text(
                      day.timeRange,
                      style: const TextStyle(color: Color(0xff9CA3AF), fontSize: 11),
                    ),
                ],
              ),
            ),
            // Add button
            _PillButton(
              icon: Icons.add,
              label: 'Add',
              onTap: () {},
            ),
            const SizedBox(width: 6),
            // Edit button
            Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                color: const Color(0xffF3F4F6),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.edit_outlined, size: 14, color: Color(0xff6B7280)),
            ),
          ],
        ),

        const SizedBox(height: 14),

        // ── Attraction thumbnails ─────────────────────────
        _AttractionsRow(attractions: day.attractions),

        const SizedBox(height: 14),

        // ── Hotel card ────────────────────────────────────
        if (day.hotel != null) ...[
          _HotelCard(hotel: day.hotel!),
          const SizedBox(height: 12),
        ],

        // ── View details link ─────────────────────────────
        GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              Text(
                'View Day ${day.dayNumber} Details',
                style: const TextStyle(
                  color: Color(0xff6C63FF),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 4),
              const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Color(0xff6C63FF),
                size: 18,
              ),
            ],
          ),
        ),

        if (!isLast) ...[
          const SizedBox(height: 18),
          Divider(color: Colors.grey.shade100, thickness: 1.5),
          const SizedBox(height: 18),
        ] else
          const SizedBox(height: 18),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  Pill button  (Add / etc.)
// ─────────────────────────────────────────────────────────────
class _PillButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _PillButton({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: const Color(0xffEEF2FF),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(icon, size: 14, color: const Color(0xff6C63FF)),
            const SizedBox(width: 4),
            Text(
              label,
              style: const TextStyle(
                color: Color(0xff6C63FF),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  Attractions row
// ─────────────────────────────────────────────────────────────
class _AttractionsRow extends StatelessWidget {
  final List<DayAttraction> attractions;

  static const _gradients = [
    [Color(0xff818CF8), Color(0xff6C63FF)],
    [Color(0xffA78BFA), Color(0xff7C3AED)],
    [Color(0xff67E8F9), Color(0xff0891B2)],
    [Color(0xff6EE7B7), Color(0xff059669)],
  ];

  const _AttractionsRow({required this.attractions});

  @override
  Widget build(BuildContext context) {
    final show = attractions.take(3).toList();
    final extra = attractions.length - 3;

    return SizedBox(
      height: 80,
      child: Row(
        children: [
          ...List.generate(show.length, (i) {
            return Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: i < show.length - 1 ? 8 : (extra > 0 ? 8 : 0)),
                child: _AttractionThumb(
                  attraction: show[i],
                  colors: _gradients[i % _gradients.length],
                ),
              ),
            );
          }),
          if (extra > 0)
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xff7C3AED), Color(0xff4F46E5)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: Text(
                    '+$extra\nMore',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 13,
                      height: 1.25,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _AttractionThumb extends StatelessWidget {
  final DayAttraction attraction;
  final List<Color> colors;

  const _AttractionThumb({required this.attraction, required this.colors});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: colors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Icon watermark
          Center(
            child: Icon(
              Icons.landscape_outlined,
              color: Colors.white.withValues(alpha: .25),
              size: 32,
            ),
          ),
          // Bottom label overlay
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(6, 8, 6, 5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withValues(alpha: .6)],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    attraction.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    attraction.time,
                    style: const TextStyle(color: Colors.white70, fontSize: 8),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  Hotel card
// ─────────────────────────────────────────────────────────────
class _HotelCard extends StatelessWidget {
  final HotelInfo hotel;

  const _HotelCard({required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xffE5E7EB)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Thumb
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 62,
              height: 62,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff6C63FF), Color(0xffA78BFA)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Icon(Icons.hotel_rounded, color: Colors.white, size: 26),
            ),
          ),
          const SizedBox(width: 12),

          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (hotel.isNightStay)
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: const Color(0xff1E1B4B),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.nightlight_round, color: Colors.white, size: 10),
                        SizedBox(width: 4),
                        Text(
                          'Night Stay',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                Text(
                  hotel.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                    color: Color(0xff1E1B4B),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  hotel.location,
                  style: const TextStyle(color: Color(0xff9CA3AF), fontSize: 11),
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    const Icon(Icons.phone_outlined, size: 11, color: Color(0xff9CA3AF)),
                    const SizedBox(width: 3),
                    Text(
                      hotel.phone,
                      style: const TextStyle(color: Color(0xff9CA3AF), fontSize: 11),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Price + action
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                hotel.pricePerNight,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 15,
                  color: Color(0xff1E1B4B),
                ),
              ),
              const Text(
                'Per Night',
                style: TextStyle(color: Color(0xff9CA3AF), fontSize: 10),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff6C63FF)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Change Hotel',
                    style: TextStyle(
                      color: Color(0xff6C63FF),
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}