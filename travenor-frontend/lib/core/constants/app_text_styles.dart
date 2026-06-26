import 'package:flutter/material.dart';
import 'package:travenor/core/constants/app_color.dart';
import 'package:travenor/core/constants/app_text_sizes.dart';

class AppTextStyles {
  static const heading = TextStyle(
    fontSize: AppSizes.xlarge,
    fontWeight: AppSizes.bold,
    color: AppColor.headTextBlack
  );

  static const orangeHeading = TextStyle(
    fontSize: AppSizes.xlarge,
    fontWeight: AppSizes.bold,
    color: AppColor.headTextOrange
  );

  static const body = TextStyle(
    fontSize: AppSizes.medium,
    color: AppColor.paragraphTextBlack
  );
}