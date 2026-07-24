import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/constants/app_colors.dart';
import '../../data/onboarding_data.dart';
import '../../widgets/onboarding_page.dart';
import '../../widgets/primary_button.dart';
import '../navigation/main_navigation.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() =>
      _OnboardingScreenState();
}

class _OnboardingScreenState
    extends State<OnboardingScreen> {
  final PageController _controller = PageController();

  bool lastPage = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void nextPage() {
    if (!_controller.hasClients) return;

    _controller.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void skip() {
    if (!_controller.hasClients) return;

    _controller.animateToPage(
      onboardingData.length - 1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void finishOnboarding() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const MainNavigation(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: onboardingData.length,

                onPageChanged: (index) {
                  setState(() {
                    lastPage =
                        index == onboardingData.length - 1;
                  });
                },

                itemBuilder: (context, index) {
                  return OnboardingPage(
                    item: onboardingData[index],
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(
                24,
                0,
                24,
                30,
              ),

              child: Row(
                children: [
                  TextButton(
                    onPressed: skip,

                    child: const Text(
                      "Skip",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  const Spacer(),

                  SmoothPageIndicator(
                    controller: _controller,
                    count: onboardingData.length,

                    effect: WormEffect(
                      activeDotColor: AppColors.primary,
                      dotColor: Colors.grey.shade300,
                      dotHeight: 12,
                      dotWidth: 12,
                    ),
                  ),

                  const Spacer(),

                  AnimatedSwitcher(
                    duration:
                        const Duration(milliseconds: 300),

                    child: PrimaryButton(
                      key: ValueKey(lastPage),
                      title: lastPage
                          ? "Get Started"
                          : "Next",

                      onPressed: () {
                        if (lastPage) {
                          finishOnboarding();
                        } else {
                          nextPage();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}