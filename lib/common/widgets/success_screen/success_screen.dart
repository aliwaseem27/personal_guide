import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:personal_guide/utils/constants/app_strings.dart';

import '../../../utils/constants/app_sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../styles/spacing_styles.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.onPressed,
    this.imageIsLottie = false,
  });

  final String image, title, subtitle;
  final VoidCallback onPressed;
  final bool imageIsLottie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppSpacingStyle.paddingWithAppBarHeight * 2,
        child: Column(
          children: [
            !imageIsLottie ?
            Image(
              image: AssetImage(image),
              width: THelperFunctions.screenWidth() * 0.6,
            ) : Lottie.asset(image, width: THelperFunctions.screenWidth() * 0.6),
            const SizedBox(height: AppSizes.spaceBtwSections),

            // Title & Subtitle
            Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
            const SizedBox(height: AppSizes.spaceBtwItems),
            Text(subtitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
            const SizedBox(height: AppSizes.spaceBtwSections),

            // Buttons
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: onPressed, child: const Text(AppTexts.tContinue)),
            ),
          ],
        ),
      ),
    );
  }
}
