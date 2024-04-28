import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:personal_guide/common/widgets/social_buttons.dart';
import 'package:personal_guide/features/authentication/screens/sign_up/widgets/signup_form.dart';
import 'package:personal_guide/utils/constants/app_sizes.dart';
import 'package:personal_guide/utils/constants/app_strings.dart';

@RoutePage()
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(AppTexts.signupTitle, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: AppSizes.spaceBtwSections),

              // Form
              const SignUpForm(),
              const SizedBox(height: AppSizes.spaceBtwSections),

              // Divider
              // TFormDivider(dividerText: TTexts.orSignUpWith.capitalize!),
              const SizedBox(height: AppSizes.spaceBtwSections),

              //Social Buttons
              const AppSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
