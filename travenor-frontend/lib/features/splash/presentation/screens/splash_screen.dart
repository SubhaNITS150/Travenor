import 'package:flutter/material.dart';
import 'package:travenor/core/storage/onboarding_storage.dart';
import 'package:travenor/features/auth/data/services/auth_service.dart';
import 'package:travenor/features/auth/presentation/screens/login_screen.dart';
import 'package:travenor/features/navigation/presentation/screens/navigation_main_screen.dart';
import 'package:travenor/features/onboarding/presentation/screens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    // Show splash for 2 seconds
    await Future.delayed(const Duration(seconds: 2));

    final onboardingCompleted = await AppPreferences.isOnboardingCompleted();

    if (!mounted) return;

    // First app launch
    if (!onboardingCompleted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const OnboardingScreen()),
      );
      return;
    }

    final authService = AuthService();

    final isAuthenticated = await authService.refreshSession();
    print(isAuthenticated);

    if (!mounted) return;

    // User already logged in
    if (isAuthenticated) {
      Navigator.pushReplacement(
        context,
        // MaterialPageRoute(builder: (_) => OtpVerificationScreen(email: 'subhajyoti_ug_23@cse.nits.ac.in')),
        MaterialPageRoute(builder: (_) => MainScreen())
      );
    } else {
      // User not logged in
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Travenor',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
