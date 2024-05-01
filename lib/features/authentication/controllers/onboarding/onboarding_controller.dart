import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../screens/login/login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  // Variables
  final PageController pageController = PageController();
  Rx<int> currentPageIndicator = 0.obs;
  final animationDuration = const Duration(milliseconds: 300);
  final animationCurve = Curves.linear;

  // Update Current Index when Page Scroll
  void updatePageIndicator(index) => currentPageIndicator.value = index;

  // Jump to the specific dot selected page.
  void dotNavigationClick(index) {
    currentPageIndicator.value = index;
    pageController.animateToPage(
      currentPageIndicator.value,
      duration: animationDuration,
      curve: animationCurve,
    );
  }

  // Update Current Index & Jump to next page.
  void nextPage() {
    if (currentPageIndicator.value == 2) {
      final storage = GetStorage();
      storage.write("isFirstTime", false);
      Get.offAll(() => const LoginScreen());
    } else {
      currentPageIndicator.value += 1;
      pageController.animateToPage(
        currentPageIndicator.value,
        duration: animationDuration,
        curve: Curves.linear,
      );
    }
  }

  // Update Current Index & Jump to the last page.
  void skipPage() {
    currentPageIndicator.value = 2;
    pageController.animateToPage(
      currentPageIndicator.value,
      duration: animationDuration,
      curve: animationCurve,
    );
  }
}
