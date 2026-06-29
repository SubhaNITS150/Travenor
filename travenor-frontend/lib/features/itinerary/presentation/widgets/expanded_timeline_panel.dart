import 'package:flutter/material.dart';
import 'package:travenor/features/itinerary/data/itinerary_data.dart';
import 'day_card.dart';

class ExpandedTimelinePanel extends StatelessWidget {
  final TripData trip;

  /// Master animation: 0 = collapsed, 1 = fully open.
  /// Used only to trigger stagger on first build.
  final Animation<double> animation;
  final VoidCallback onClose;

  const ExpandedTimelinePanel({
    super.key,
    required this.trip,
    required this.animation,
    required this.onClose,
  });

  static const _purple = Color(0xff6C63FF);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffFAFAFF),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .12),
            blurRadius: 32,
            offset: const Offset(0, -6),
          ),
        ],
      ),
      child: Column(
        children: [
          // ── Drag handle ──────────────────────────────────
          const SizedBox(height: 10),
          Center(
            child: Container(
              width: 44,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xffDDD6FE),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // ── Header ───────────────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Container(
                  height: 46,
                  width: 46,
                  decoration: BoxDecoration(
                    color: const Color(0xffEEF2FF),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(Icons.route_rounded, color: _purple, size: 22),
                ),
                const SizedBox(width: 14),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Complete Itinerary',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Color(0xff1E1B4B),
                          letterSpacing: -0.4,
                        ),
                      ),
                      Text(
                        'Day-wise plan · Hotels · Attractions',
                        style: TextStyle(color: Color(0xff9CA3AF), fontSize: 12),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: onClose,
                  child: Container(
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                      color: const Color(0xffF3F4F6),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Color(0xff6B7280),
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          Divider(color: Colors.grey.shade100, thickness: 1.5),

          // ── Staggered day cards ───────────────────────────
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(20, 14, 20, 32),
              physics: const BouncingScrollPhysics(),
              itemCount: trip.days.length,
              itemBuilder: (context, i) => _StaggeredDayCard(
                day: trip.days[i],
                index: i,
                isLast: i == trip.days.length - 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StaggeredDayCard extends StatefulWidget {
  final DayItinerary day;
  final int index;
  final bool isLast;

  const _StaggeredDayCard({
    required this.day,
    required this.index,
    required this.isLast,
  });

  @override
  State<_StaggeredDayCard> createState() => _StaggeredDayCardState();
}

class _StaggeredDayCardState extends State<_StaggeredDayCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 460),
    );
    _fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
    _slide = Tween<Offset>(
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));

    Future.delayed(Duration(milliseconds: 80 + widget.index * 90), () {
      if (mounted) _ctrl.forward();
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fade,
      child: SlideTransition(
        position: _slide,
        child: DayCard(day: widget.day, isLast: widget.isLast),
      ),
    );
  }
}