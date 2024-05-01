import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:personal_guide/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';

import '../../../../utils/constants/app_strings.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../controllers/onboarding/onboarding_controller.dart';
import 'widgets/onboarding_dot_navigation.dart';
import 'widgets/onboarding_next_button.dart';
import 'widgets/onboarding_page.dart';

class OnBoardingScreen extends StatelessWidget {
   OnBoardingScreen({super.key});

  final controller = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: AppTexts.onBoardingTitle1,
                subtitle: AppTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: AppTexts.onBoardingTitle2,
                subtitle: AppTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: AppTexts.onBoardingTitle3,
                subtitle: AppTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          // Skip Button
          const OnBoardingSkip(),

          // Dot Navigation SmoothPageIndicator
          OnboardingDotNavigation(),

          // Circular Button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
