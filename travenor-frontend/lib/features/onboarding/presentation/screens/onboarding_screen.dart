import 'package:flutter/material.dart';
import 'package:travenor/core/constants/app_color.dart';
import 'package:travenor/core/constants/app_text_sizes.dart';
import 'package:travenor/core/storage/onboarding_storage.dart';
import 'package:travenor/features/auth/presentation/screens/register_screen.dart';
import 'package:travenor/features/onboarding/presentation/widgets/onboarding_page.dart';
import 'package:travenor/features/onboarding/presentation/widgets/onboarding_text.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();

  bool isLastPage = false;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      precacheImage(const AssetImage('assets/images/onboarding1.jpg'), context);
      precacheImage(const AssetImage('assets/images/onboarding2.jpg'), context);
      precacheImage(const AssetImage('assets/images/onboarding3.jpg'), context);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void nextPage() async {
    if (isLastPage) {
      await AppPreferences.setOnboardingCompleted();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => RegisterScreen())
      );
      // print("Home");
    } else {
      _controller.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
                isLastPage = index == 2;
              });
            },

            children: [
              OnboardingPage(
                image: 'assets/images/onboarding1.jpg',
                title: Center(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: const Text(
                          "Life is short and the world is ",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: AppSizes.xbold,
                            color: AppColor.headTextBlack,
                          ),
                        ),
                      ),
                      OnboardingText(text: "wide"),
                    ],
                  ),
                ),

                subtitle:
                    "At Friends tours and travel, we customize reliable and trustworthy educational tours to destinations all over the world",
                currentIndex: currentIndex,
                onNext: nextPage,
                isLastPage: currentIndex == 2,
              ),

              // OnboardingPage(
              //   image: 'assets/images/onboarding2.jpg',
              //   title: "Travel Smart",
              //   subtitle: "Plan your trips with ease and confidence",
              //   currentIndex: currentIndex,
              // ),
              OnboardingPage(
                image: 'assets/images/onboarding2.jpg',
                title: Center(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: const Text(
                          "Life is short and the world is ",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: AppSizes.xbold,
                            color: AppColor.headTextBlack,
                          ),
                        ),
                      ),
                      OnboardingText(text: "wide"),
                    ],
                  ),
                ),

                subtitle:
                    "At Friends tours and travel, we customize reliable and trustworthy educational tours to destinations all over the world",
                currentIndex: currentIndex,
                onNext: nextPage,
                isLastPage: currentIndex == 2,
              ),

              // OnboardingPage(
              //   image: 'assets/images/onboarding3.jpg',
              //   title: "Get Started",
              //   subtitle: "Let’s begin your journey today",
              //   currentIndex: currentIndex,
              // ),
              OnboardingPage(
                image: 'assets/images/onboarding3.jpg',
                title: Center(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: const Text(
                          "Life is short and the world is ",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: AppSizes.xbold,
                            color: AppColor.headTextBlack,
                          ),
                        ),
                      ),
                      OnboardingText(text: "wide"),
                    ],
                  ),
                ),

                subtitle:
                    "At Friends tours and travel, we customize reliable and trustworthy educational tours to destinations all over the world",
                currentIndex: currentIndex,
                onNext: nextPage,
                isLastPage: currentIndex == 2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
