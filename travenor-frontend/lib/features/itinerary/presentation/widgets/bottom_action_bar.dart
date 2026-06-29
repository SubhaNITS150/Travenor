// ─────────────────────────────────────────────────────────────
//  itinerary/presentation/widgets/bottom_action_bar.dart
// ─────────────────────────────────────────────────────────────
import 'package:flutter/material.dart';

class BottomActionBar extends StatelessWidget {
  final VoidCallback? onCustomise;
  final VoidCallback? onSave;

  const BottomActionBar({super.key, this.onCustomise, this.onSave});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 14, 20, MediaQuery.of(context).padding.bottom + 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .07),
            blurRadius: 20,
            offset: const Offset(0, -6),
          ),
        ],
      ),
      child: Row(
        children: [
          // Customise button
          Expanded(
            child: GestureDetector(
              onTap: onCustomise,
              child: Container(
                height: 54,
                decoration: BoxDecoration(
                  color: const Color(0xffF3F4F6),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.tune_rounded, color: Color(0xff4B5563), size: 18),
                    SizedBox(width: 8),
                    Text(
                      'Customise Plan',
                      style: TextStyle(
                        color: Color(0xff4B5563),
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),
          // Save button
          Expanded(
            child: GestureDetector(
              onTap: onSave,
              child: Container(
                height: 54,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xff6C63FF), Color(0xff9F7AEA)],
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff6C63FF).withValues(alpha: .35),
                      blurRadius: 14,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.bookmark_add_rounded, color: Colors.white, size: 18),
                    SizedBox(width: 8),
                    Text(
                      'Save Itinerary',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}