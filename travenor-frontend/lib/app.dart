import 'package:flutter/material.dart';
import 'package:travenor/core/theme/app_theme.dart';
// import 'package:travenor/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:travenor/features/splash/presentation/screens/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travenor',
      debugShowCheckedModeBanner: false,

      theme: AppTheme.lightTheme,

      home: SplashScreen(),
    );
  }
}