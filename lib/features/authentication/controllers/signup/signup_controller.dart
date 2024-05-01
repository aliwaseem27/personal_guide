import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../data/repositories/user/user_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';
import '../../models/user_model.dart';
import '../../screens/signup/verify_email.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// SIGNUP
  void signup() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog("We are processing your information...", TImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Privacy Policy check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
          title: "Accept Privacy Policy",
          message: "In order to create account, you must have to read and accept the Privacy Policy and Terms of Use.",
        );
        return;
      }

      // Register user in the FireBase Authentication & Save user data in the FireBase
      final userCredential =
          await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Save authenticated user data in the FireStore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: "",
      );

      final userRepository = Get.put(UserRepository());
      userRepository.saveUserRecord(newUser);

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Message
      TLoaders.successSnackBar(
          title: "Congratulations", message: "Your account has been created! Verify email to continue.");

      // Move to verify email screen
      Get.to(() =>  VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show more Generic Error to the user
      TLoaders.errorSnackBar(title: "Oh snap!", message: e.toString());
    }
  }
}
