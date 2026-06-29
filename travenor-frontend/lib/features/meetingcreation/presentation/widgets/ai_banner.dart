import 'package:flutter/material.dart';

class AIBanner extends StatelessWidget {
  const AIBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff6C63FF),
            Color(0xff8B5CF6),
            Color(0xffA855F7),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff6C63FF).withOpacity(.25),
            blurRadius: 25,
            offset: const Offset(0, 12),
          ),
        ],
      ),

      child: Stack(
        children: [
          /// Decorative circles
          Positioned(
            left: -40,
            top: -40,
            child: Container(
              height: 140,
              width: 140,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.08),
                shape: BoxShape.circle,
              ),
            ),
          ),

          Positioned(
            right: -20,
            bottom: -30,
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.06),
                shape: BoxShape.circle,
              ),
            ),
          ),

          /// Left audio waveform
          Positioned(
            left: 20,
            top: 55,
            child: Opacity(
              opacity: .35,
              child: Icon(
                Icons.graphic_eq_rounded,
                color: Colors.white,
                size: 70,
              ),
            ),
          ),

          /// Right waveform
          Positioned(
            right: 20,
            top: 45,
            child: Opacity(
              opacity: .35,
              child: Icon(
                Icons.multitrack_audio,
                color: Colors.white,
                size: 70,
              ),
            ),
          ),

          /// Floating mic
          Positioned(
            left: 45,
            bottom: 35,
            child: _FloatingCircle(
              icon: Icons.mic,
            ),
          ),

          /// Floating audio icon
          Positioned(
            right: 45,
            bottom: 25,
            child: _FloatingCircle(
              icon: Icons.audiotrack,
            ),
          ),

          /// Main Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// Robot Placeholder
                Container(
                  height: 88,
                  width: 88,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.12),
                        blurRadius: 18,
                      )
                    ],
                  ),
                  child: const Icon(
                    Icons.smart_toy_rounded,
                    size: 48,
                    color: Color(0xff6C63FF),
                  ),
                ),

                const SizedBox(height: 18),

                const Text(
                  "AI Meeting Analysis",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -.3,
                  ),
                ),

                const SizedBox(height: 8),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35),
                  child: Text(
                    "Upload your meeting recording and let AI extract destinations, preferences and generate the perfect itinerary.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FloatingCircle extends StatelessWidget {
  final IconData icon;

  const _FloatingCircle({
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.18),
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white.withOpacity(.25),
        ),
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 24,
      ),
    );
  }
}