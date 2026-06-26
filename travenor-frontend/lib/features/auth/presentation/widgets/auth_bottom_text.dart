import 'package:flutter/material.dart';
import 'package:travenor/core/constants/app_text_sizes.dart';

class AuthBottomText extends StatelessWidget {
  final String normalText;
  final String actionText;
  final VoidCallback onTap;

  const AuthBottomText({
    super.key,
    required this.normalText,
    required this.actionText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(normalText, style: TextStyle(fontSize: AppSizes.medium)),
        TextButton(
          onPressed: onTap,
          child: Text(actionText, style: TextStyle(fontSize: AppSizes.medium)),
        ),
      ],
    );
  }
}
