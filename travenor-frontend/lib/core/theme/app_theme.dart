import 'package:flutter/material.dart';
import 'package:travenor/core/constants/app_color.dart';
import 'package:travenor/core/constants/app_text_styles.dart';

class AppTheme {
  // AppTheme._();

  // Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    primaryColor: AppColor.primary,
    scaffoldBackgroundColor: AppColor.background,

    colorScheme: ColorScheme.light(
      primary: AppColor.primary,
      secondary: AppColor.background,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.primary,
      elevation: 0,
      centerTitle: true,
    ),

    textTheme: TextTheme(
      headlineLarge: AppTextStyles.heading,
      bodyMedium: AppTextStyles.body,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primary,
        foregroundColor: Colors.white,

        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );

  // Dark Theme
}
