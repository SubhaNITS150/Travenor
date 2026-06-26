import 'package:flutter/material.dart';
import 'package:travenor/core/constants/app_color.dart';
import 'package:travenor/core/constants/app_text_sizes.dart';

class OnboardingText extends StatelessWidget {
  final String text;
  
  const OnboardingText({
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,

      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 26,
            fontWeight: AppSizes.xbold,
            color: AppColor.headTextBlack
          ),
        ),

        const SizedBox(height: 2,),

        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              "assets/images/onboarding_text_deco.jpeg",
              width: 60,
              fit: BoxFit.contain,
            )
          ],
        )
      ],
    );
  }
}