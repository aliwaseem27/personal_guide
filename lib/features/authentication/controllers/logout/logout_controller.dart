import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/app_sizes.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/loaders.dart';

class LogoutController extends GetxController{
  static LogoutController get instance => Get.find();


  void logoutWarningPopup(){
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(AppSizes.md),
      title: "Logout Confirmation",
      middleText:
      "Do you want to logout from this account?",
      confirm: ElevatedButton(
        onPressed: () async => logout(),
        style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, side: const BorderSide(color: Colors.orangeAccent)),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.lg),
          child: Text("Logout"),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Text("Cancel"),
      ),
    );
  }

  Future<void> logout() async {
    try {
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        TLoaders.warningSnackBar(title: "Check Your Internet", message: "Seems like you are disconnected.");
        return;
      }

      AuthenticationRepository.instance.logout();
      AuthenticationRepository.instance.screenRedirect();

      TLoaders.successSnackBar(title: "Logout Success");
    } catch (e){
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}