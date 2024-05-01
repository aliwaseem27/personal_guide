import 'package:flutter/material.dart';
import 'package:personal_guide/utils/constants/app_sizes.dart';
import 'package:personal_guide/utils/constants/app_strings.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 150,
          image: AssetImage(dark ? TImages.lightAppLogo : TImages.darkAppLogo),
        ),
        Text(AppTexts.loginTitle, style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: AppSizes.sm),
        Text(AppTexts.loginSubTitle, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}