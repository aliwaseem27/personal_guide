import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_sizes.dart';
import '../../../../../utils/constants/app_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/signup/signup_controller.dart';

class TTermsAndConditions extends StatelessWidget {
  const TTermsAndConditions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = SignupController.instance;
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(() => Checkbox(
                value: controller.privacyPolicy.value,
                onChanged: (value) {
                  controller.privacyPolicy.value = !controller.privacyPolicy.value;
                },
              )),
        ),
        const SizedBox(width: AppSizes.spaceBtwInputFields),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(text: '${AppTexts.iAgreeTo} ', style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: AppTexts.privacyPolicy,
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                          color: dark ? AppColors.white : AppColors.primary,
                          decoration: TextDecoration.underline,
                          decorationColor: dark ? AppColors.white : AppColors.primary,
                        )),
                TextSpan(text: ' ${AppTexts.and} ', style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                  text: AppTexts.termsOfUse,
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark ? AppColors.white : AppColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: dark ? AppColors.white : AppColors.primary,
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
