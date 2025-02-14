import 'package:the_smart_store_user/utils/device/device_utility.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/signup_controller.dart';

class MTermsAndConditionCheckbox extends StatelessWidget {
  const MTermsAndConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    return Row(
      children: [
        /// CHECKBOX => Wrap in a Sized box to remove extra padding
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () => Checkbox(value: controller.privacyPolicy.value, onChanged: (value) => controller.privacyPolicy.value = value!),
          ),
        ),
        const SizedBox(width: MSizes.md),
        Flexible(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(text: '${MTexts .iAgreeTo} ', style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                  text: MTexts .privacyPolicy,
                  recognizer: TapGestureRecognizer()..onTap = () => MDeviceUtils.launchWebsiteUrl('https://youtube.com/'),
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: MHelperFunctions.isDarkMode(context) ? MColors.white : MColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: MHelperFunctions.isDarkMode(context) ? MColors.white : MColors.primary,
                      ),
                ),
                TextSpan(text: ' ${MTexts .and} ', style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                  text: MTexts .termsOfUse,
                  recognizer: TapGestureRecognizer()..onTap = () => MDeviceUtils.launchWebsiteUrl('https://youtube.com/'),
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: MHelperFunctions.isDarkMode(context) ? MColors.white : MColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: MHelperFunctions.isDarkMode(context) ? MColors.white : MColors.primary,
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
