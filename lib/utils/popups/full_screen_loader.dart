import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helpers/helper_functions.dart';

import '../../common/widgets/loaders/animation_loader.dart';
import '../constants/app_colors.dart';

class TFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (context) => PopScope(
        canPop: false,
        child: Container(
          color: THelperFunctions.isDarkMode(Get.context!) ? AppColors.dark : AppColors.white,
          width: double.infinity,
          height: double.infinity,
          child: ListView(
            children: [
              const SizedBox(height: 250),
              TAnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
