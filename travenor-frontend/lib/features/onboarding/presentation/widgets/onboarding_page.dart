import 'package:flutter/material.dart';
import 'package:travenor/core/constants/app_color.dart';
import 'package:travenor/core/constants/app_text_sizes.dart';

class OnboardingPage extends StatelessWidget {
  final String image;
  final Widget title;
  final String subtitle;
  final int currentIndex;
  final VoidCallback onNext;
  final bool isLastPage;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.currentIndex,
    required this.onNext,
    required this.isLastPage
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(30),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// 🔹 IMAGE SECTION
          ClipRRect(
            borderRadius: BorderRadiusGeometry.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            child: Stack(
              children: [
                Image.asset(
                  image,
                  height: AppSizes.heightFraction(context, 0.5),
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                /// Skip button
                Positioned(
                  right: 20,
                  top: 40,
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// 🔹 TEXT SECTION
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                /// Title
                Center(child: title),

                const SizedBox(height: 12),

                /// Subtitle
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColor.paragraphTextBlack,
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                /// 🔹 DOTS (you can replace later with controller)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) {
                    return buildDot(index == currentIndex);
                  }),
                ),
              ],
            ),
          ),

          /// 🔹 BUTTON
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: onNext,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.buttonBackground,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: Text(
                  isLastPage ? "Get Started" : "Next", 
                  style: TextStyle(fontWeight: AppSizes.bold, fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 DOT WIDGET
  Widget buildDot(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 6,
      width: isActive ? 20 : 6,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
