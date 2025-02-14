import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import 'widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MAppBar(showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///  Title
              Text(MTexts .signupTitle, style: Theme.of(context).textTheme.headlineMedium),

              /// Form
              const MSignupForm(),
              const SizedBox(height: MSizes.spaceBtwSections),

              /// Divider
              MFormDivider(dividerText: MTexts .orSignUpWith.capitalize!),
              const SizedBox(height: MSizes.spaceBtwSections),

              /// Social Buttons
              const MSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
