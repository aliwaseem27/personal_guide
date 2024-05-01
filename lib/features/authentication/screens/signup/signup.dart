import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_guide/features/authentication/screens/signup/widgets/signup_form.dart';

import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../../utils/constants/app_sizes.dart';
import '../../../../utils/constants/app_strings.dart';


class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(AppTexts.signupTitle, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: AppSizes.spaceBtwSections),

              // Form
              const TSignupForm(),
              const SizedBox(height: AppSizes.spaceBtwSections),

              // Divider
              TFormDivider(dividerText: AppTexts.orSignUpWith.capitalize!),
              const SizedBox(height: AppSizes.spaceBtwSections),

              // Social Buttons
              const AppSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
