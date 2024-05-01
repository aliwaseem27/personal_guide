import 'package:personal_guide/features/authentication/controllers/login/login_controller.dart';
import 'package:personal_guide/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:personal_guide/features/authentication/screens/signup/signup.dart';
import 'package:personal_guide/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/app_sizes.dart';
import '../../../../../utils/constants/app_strings.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.spaceBtwSections),
      child: Form(
        key: controller.loginFormKey,
        child: Column(
          children: [
            // Email
            TextFormField(
              controller: controller.email,
              validator: (value) => TValidator.validateEmail(value),
              decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct_right), labelText: AppTexts.email),
            ),
            const SizedBox(height: AppSizes.spaceBtwInputFields),

            // Password
            Obx(
              () => TextFormField(
                  controller: controller.password,
                  validator: (value) => TValidator.validateEmptyText("Password", value),
                  obscureText: controller.hidePassword.value,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.password_check),
                    labelText: AppTexts.password,
                    suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                        icon: controller.hidePassword.value ? const Icon(Iconsax.eye_slash) : const Icon(Iconsax.eye)),
                  )),
            ),
            const SizedBox(height: AppSizes.spaceBtwInputFields / 2),

            // Remember Me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Remember Me
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) {
                          controller.rememberMe.value = !controller.rememberMe.value;
                        },
                      ),
                    ),
                    const Text(AppTexts.rememberMe),
                  ],
                ),

                // Forget Password
                TextButton(
                    onPressed: () => Get.to(() => const ForgetPassword()), child: const Text(AppTexts.forgetPassword)),
              ],
            ),
            const SizedBox(height: AppSizes.spaceBtwSections),

            // Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.emailAndPasswordSignIn(), child: const Text(AppTexts.signIn)),
            ),
            const SizedBox(height: AppSizes.spaceBtwItems),

            // Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () => Get.to(() => const SignupScreen()), child: const Text(AppTexts.createAccount)),
            ),
          ],
        ),
      ),
    );
  }
}
