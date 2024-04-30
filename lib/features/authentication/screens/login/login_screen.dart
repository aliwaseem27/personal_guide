import 'package:flutter/material.dart';
import 'package:personal_guide/common/widgets/social_buttons.dart';
import 'package:personal_guide/features/authentication/screens/login/widgets/login_form.dart';
import 'package:personal_guide/utils/constants/app_sizes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: AppSizes.defaultSpace,
            right: AppSizes.defaultSpace,
            bottom: AppSizes.defaultSpace,
            top: AppSizes.appBarHeight,
          ),
          child: Column(
            children: [
              // Logo, Title & Sub-Title
              // const TLoginHeader(),

              // Form
              const LoginForm(),

              // Divider
              // TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
              const SizedBox(height: AppSizes.spaceBtwSections),

              // Footer
              const AppSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
