import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_guide/features/authentication/screens/login/widgets/login_form.dart';
import 'package:personal_guide/features/authentication/screens/login/widgets/login_header.dart';

import '../../../../common/styles/spacing_styles.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../../utils/constants/app_sizes.dart';
import '../../../../utils/constants/app_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: AppSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              // Logo, Title & Sub-Title
              const TLoginHeader(),

              // Form
              const TLoginForm(),

              // Divider
              TFormDivider(dividerText: AppTexts.orSignInWith.capitalize!),
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








