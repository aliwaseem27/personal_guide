import 'package:flutter/material.dart';
import 'package:personal_guide/utils/constants/app_images.dart';
import 'package:personal_guide/utils/constants/app_sizes.dart';

class AppSocialButtons extends StatelessWidget {
  const AppSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: (){},
            icon: const Image(
              width: AppSizes.iconMd,
              height: AppSizes.iconMd,
              image: AssetImage(AppImages.google),
            ),
          ),
        ),
        const SizedBox(width: AppSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: AppSizes.iconMd,
              height: AppSizes.iconMd,
              image: AssetImage(AppImages.facebook),
            ),
          ),
        ),
      ],
    );
  }
}