import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../data/itinerary_data.dart';
import '../widgets/trip_header.dart';
import '../widgets/stats_card.dart';
import '../widgets/journey_route_overview.dart';
import '../widgets/route_node.dart';
import '../widgets/trip_cost_summary.dart';
import '../widgets/expanded_timeline_panel.dart';
import '../widgets/bottom_action_bar.dart';

class ItineraryScreen extends StatefulWidget {
  const ItineraryScreen({super.key});

  @override
  State<ItineraryScreen> createState() => _ItineraryScreenState();
}

class _ItineraryScreenState extends State<ItineraryScreen>
    with SingleTickerProviderStateMixin {
  // ── Animation controller for the panel ────────────────────
  late final AnimationController _panelCtrl;

  // ── Derived animations ────────────────────────────────────
  late final Animation<double> _backdropOpacity;
  late final Animation<double> _overviewCardScale;
  late final Animation<double> _overviewCardOpacity;
  late final Animation<double> _panelSlide;   // 0=hidden, 1=visible

  bool _panelVisible = false;

  static const _trip = kMeghalayaTrip;
  static const _purple = Color(0xff6C63FF);

  // Route stops for the compact overview list
  static const _stops = [
    _Stop('Guwahati', 'Start Point',       isFirst: true),
    _Stop('Shillong', 'Day 1 • Overnight'),
    _Stop('Cherrapunji', 'Day 2'),
    _Stop('Mawlynnong', 'Day 3'),
    _Stop('Dawki', 'Day 4 • End',         isLast: true),
  ];

  @override
  void initState() {
    super.initState();

    _panelCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 520),
    );

    _backdropOpacity = Tween<double>(begin: 0, end: 0.55).animate(
      CurvedAnimation(parent: _panelCtrl, curve: const Interval(0, 0.6, curve: Curves.easeOut)),
    );

    _overviewCardScale = Tween<double>(begin: 1.0, end: 0.94).animate(
      CurvedAnimation(parent: _panelCtrl, curve: const Interval(0, 0.4, curve: Curves.easeOut)),
    );

    _overviewCardOpacity = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _panelCtrl, curve: const Interval(0, 0.3, curve: Curves.easeIn)),
    );

    _panelSlide = CurvedAnimation(
      parent: _panelCtrl,
      curve: const Interval(0.10, 1.0, curve: _SpringCurve()),
    );
  }

  @override
  void dispose() {
    _panelCtrl.dispose();
    super.dispose();
  }

  void _openPanel() {
    HapticFeedback.lightImpact();
    setState(() => _panelVisible = true);
    _panelCtrl.forward();
  }

  void _closePanel() {
    HapticFeedback.lightImpact();
    _panelCtrl.reverse().then((_) {
      if (mounted) setState(() => _panelVisible = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final panelHeight = size.height * 0.84;

    return Scaffold(
      backgroundColor: const Color(0xffF5F3FF),
      body: Stack(
        children: [
          // ════════════════════════════════════════════════
          //  LAYER 1 – main scrollable content
          // ════════════════════════════════════════════════
          Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverToBoxAdapter(
                      child: SafeArea(
                        bottom: false,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Header
                            TripHeader(
                              tripTitle: _trip.title,
                              duration: _trip.duration,
                            ),
                            const SizedBox(height: 18),

                            // Stats row
                            StatsCard(
                              destinations: _trip.destinations,
                              hotels: _trip.hotels,
                              totalCost: _trip.totalCost,
                            ),
                            const SizedBox(height: 18),

                            // Journey route overview card (animated scale)
                            AnimatedBuilder(
                              animation: _panelCtrl,
                              builder: (_, child) => Transform.scale(
                                scale: _overviewCardScale.value,
                                child: Opacity(
                                  opacity: _overviewCardOpacity.value.clamp(0.0, 1.0),
                                  child: child,
                                ),
                              ),
                              child: JourneyRouteOverview(onExpand: _openPanel),
                            ),
                            const SizedBox(height: 14),

                            // Route node list (compact)
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: List.generate(_stops.length, (i) {
                                  final s = _stops[i];
                                  return RouteNode(
                                    title: s.title,
                                    subtitle: s.subtitle,
                                    isFirst: s.isFirst,
                                    isLast: s.isLast,
                                  );
                                }),
                              ),
                            ),
                            const SizedBox(height: 18),

                            // Trip cost summary
                            TripCostSummary(estimatedCost: _trip.totalCost),
                            const SizedBox(height: 18),

                            // Show complete timeline button
                            _ShowTimelineButton(onTap: _openPanel),
                            const SizedBox(height: 12),

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                'See day-wise plan, places, hotels & more',
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            const SizedBox(height: 100),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // ════════════════════════════════════════════════
          //  LAYER 2 – backdrop dim + blur
          // ════════════════════════════════════════════════
          if (_panelVisible)
            AnimatedBuilder(
              animation: _backdropOpacity,
              builder: (_, __) => GestureDetector(
                onTap: _closePanel,
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: _backdropOpacity.value * 6,
                    sigmaY: _backdropOpacity.value * 6,
                  ),
                  child: Container(
                    color: Colors.black.withValues(alpha: _backdropOpacity.value),
                  ),
                ),
              ),
            ),

          // ════════════════════════════════════════════════
          //  LAYER 3 – expanded timeline panel
          // ════════════════════════════════════════════════
          if (_panelVisible)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: panelHeight,
              child: AnimatedBuilder(
                animation: _panelSlide,
                builder: (_, child) {
                  final t = _panelSlide.value;
                  final dy = (1.0 - t) * panelHeight;
                  return Transform.translate(
                    offset: Offset(0, dy),
                    child: child,
                  );
                },
                child: ExpandedTimelinePanel(
                  trip: _trip,
                  animation: _panelCtrl,
                  onClose: _closePanel,
                ),
              ),
            ),

          // ════════════════════════════════════════════════
          //  LAYER 4 – bottom action bar (always on top)
          // ════════════════════════════════════════════════
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: AnimatedBuilder(
              animation: _panelCtrl,
              builder: (_, child) => AnimatedSlide(
                offset: _panelVisible
                    ? const Offset(0, 1)
                    : Offset.zero,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: child!,
              ),
              child: BottomActionBar(
                onCustomise: () {},
                onSave: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Show Complete Timeline button ───────────────────────────
class _ShowTimelineButton extends StatefulWidget {
  final VoidCallback onTap;
  const _ShowTimelineButton({required this.onTap});
  @override
  State<_ShowTimelineButton> createState() => _ShowTimelineButtonState();
}

class _ShowTimelineButtonState extends State<_ShowTimelineButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulse;

  @override
  void initState() {
    super.initState();
    _pulse = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: AnimatedBuilder(
        animation: _pulse,
        builder: (_, child) => Transform.scale(
          scale: 1.0 + _pulse.value * 0.012,
          child: child,
        ),
        child: GestureDetector(
          onTap: widget.onTap,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 19),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xff6C63FF), Color(0xff9F7AEA)],
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff6C63FF).withValues(alpha: .38),
                  blurRadius: 18,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.remove_red_eye_outlined, color: Colors.white, size: 20),
                SizedBox(width: 10),
                Text(
                  'Show Complete Timeline',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    letterSpacing: 0.2,
                  ),
                ),
                SizedBox(width: 10),
                Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white, size: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─── Data class for route stops ───────────────────────────────
class _Stop {
  final String title;
  final String subtitle;
  final bool isFirst;
  final bool isLast;

  const _Stop(this.title, this.subtitle, {this.isFirst = false, this.isLast = false});
}

// ─── Custom spring-like easing ────────────────────────────────
class _SpringCurve extends Curve {
  const _SpringCurve();

  @override
  double transformInternal(double t) {
    // Slightly overshoots then settles — feels like a spring
    return 1 - (1 - t) * (1 - t) * (1 + 2.2 * t);
  }
}