import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/success_screen/success_screen.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/app_strings.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/popups/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  // Send Email whenever VerifyScreen appears & set timer for auto redirect.
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  // Send Email verification link.
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(title: "Email Sent", message: "Please check your inbox and verify your email.");
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  // Timer to automatically redirect on Email verification.
  setTimerForAutoRedirect() {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) async {
        await FirebaseAuth.instance.currentUser!.reload();
        final user = FirebaseAuth.instance.currentUser;
        if (user?.emailVerified ?? false) {
          timer.cancel();
          Get.off(
            () => SuccessScreen(
              image: TImages.successfullyRegisterAnimation,
              imageIsLottie: true,
              title: AppTexts.yourAccountCreatedTitle,
              subtitle: AppTexts.yourAccountCreatedSubTitle,
              onPressed: () => AuthenticationRepository.instance.screenRedirect(),
            ),
          );
        }
      },
    );
  }

  // Manually check if Email verified.
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser != null && currentUser.emailVerified){
      Get.off(
            () => SuccessScreen(
          image: TImages.successfullyRegisterAnimation,
          title: AppTexts.yourAccountCreatedTitle,
          subtitle: AppTexts.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
        ),
      );
    }
  }
}
