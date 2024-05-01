import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:personal_guide/features/authentication/screens/signup/widgets/term_conditions_checkbox.dart';

import '../../../../../utils/constants/app_sizes.dart';
import '../../../../../utils/constants/app_strings.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controllers/signup/signup_controller.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          // First & Last name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) => TValidator.validateEmptyText("First name", value),
                  decoration: const InputDecoration(labelText: AppTexts.firstName, prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(width: AppSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) => TValidator.validateEmptyText("Last name", value),
                  decoration: const InputDecoration(labelText: AppTexts.lastName, prefixIcon: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),

          // username
          TextFormField(
            controller: controller.username,
            validator: (value) => TValidator.validateEmptyText("Username", value),
            decoration: const InputDecoration(labelText: AppTexts.username, prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),

          // Email
          TextFormField(
            controller: controller.email,
            validator: (value) => TValidator.validateEmail(value),
            decoration: const InputDecoration(labelText: AppTexts.email, prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),

          // Phone Number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => TValidator.validatePhoneNumber(value),
            decoration: const InputDecoration(labelText: AppTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),

          // Password
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => TValidator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                labelText: AppTexts.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                  icon: controller.hidePassword.value ? const Icon(Iconsax.eye_slash) : const Icon(Iconsax.eye),
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),

          // Terms & Conditions Checkbox
          const TTermsAndConditions(),
          const SizedBox(height: AppSizes.spaceBtwSections),

          //Signup Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: const Text(AppTexts.createAccount),
            ),
          )
        ],
      ),
    );
  }
}
