import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controllers/signup_controller.dart';
import 'terms_conditions_checkbox.dart';

class MSignupForm extends StatelessWidget {
  const MSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          const SizedBox(height: MSizes.spaceBtwSections),
          /// First & Last Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) => MValidator.validateEmptyText('First name', value),
                  expands: false,
                  decoration: const InputDecoration(labelText: MTexts .firstName, prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(width: MSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) => MValidator.validateEmptyText('Last name', value),
                  expands: false,
                  decoration: const InputDecoration(labelText: MTexts .lastName, prefixIcon: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),
          const SizedBox(height: MSizes.spaceBtwInputFields),

          /// Username
          TextFormField(
            controller: controller.username,
            validator: MValidator.validateUsername,
            expands: false,
            decoration: const InputDecoration(labelText: MTexts .username, prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(height: MSizes.spaceBtwInputFields),

          /// Email
          TextFormField(
            controller: controller.email,
            validator: MValidator.validateEmail,
            decoration: const InputDecoration(labelText: MTexts .email, prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(height: MSizes.spaceBtwInputFields),

          /// Phone Number
          TextFormField(
            controller: controller.phoneNumber,
            validator: MValidator.validatePhoneNumber,
            decoration: const InputDecoration(labelText: MTexts .phoneNo, prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(height: MSizes.spaceBtwInputFields),

          /// Password
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: MValidator.validatePassword,
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                labelText: MTexts .password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                  icon: const Icon(Iconsax.eye_slash),
                ),
              ),
            ),
          ),
          const SizedBox(height: MSizes.spaceBtwSections),

          /// Terms&Conditions Checkbox
          const MTermsAndConditionCheckbox(),
          const SizedBox(height: MSizes.spaceBtwSections),

          /// Sign Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(onPressed: () => controller.signup(), child: const Text(MTexts .createAccount)),
          ),
        ],
      ),
    );
  }
}
