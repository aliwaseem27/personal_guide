import 'package:flutter/material.dart';
import 'package:personal_guide/utils/constants/app_sizes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/onboarding/onboarding_controller.dart';

class OnboardingDotNavigation extends StatelessWidget {
   OnboardingDotNavigation({
    super.key,
  });

  final controller = OnBoardingController.instance;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Positioned(
      left: AppSizes.defaultSpace,
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        effect: ExpandingDotsEffect(activeDotColor: dark ? AppColors.light : AppColors.black, dotHeight: 6),
        count: 3,
      ),
    );
  }
}