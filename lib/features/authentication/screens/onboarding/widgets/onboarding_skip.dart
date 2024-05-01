import 'package:flutter/material.dart';
import 'package:personal_guide/utils/constants/app_sizes.dart';
import 'package:personal_guide/utils/constants/app_strings.dart';

import '../../../../../utils/device/device_utility.dart';
import '../../../controllers/onboarding/onboarding_controller.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TDeviceUtils.getAppBarHeight(),
      right: AppSizes.defaultSpace,
      child: TextButton(
        onPressed: () => OnBoardingController.instance.skipPage(),
        child: const Text(AppTexts.skip),
      ),
    );
  }
}
