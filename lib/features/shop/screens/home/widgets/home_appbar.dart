import 'package:the_smart_store_user/common/widgets/shimmers/shimmer.dart';
import 'package:the_smart_store_user/features/personalization/controllers/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../personalization/controllers/user_controller.dart';
import '../../../../personalization/screens/profile/profile.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Just to create instance and fetch values
    Get.put(SettingsController());
    final userController = Get.put(UserController());

    return MAppBar(
      title: GestureDetector(
        onTap: () => Get.to(() => const ProfileScreen()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(MTexts .homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: MColors.grey)),
            Obx(
              () {
                // Check if user Profile is still loading
                if (userController.profileLoading.value) {
                  // Display a shimmer loader while user profile is being loaded
                  return const MShimmerEffect(width: 80, height: 15);
                } else {
                  // Check if there are no record found
                  if (userController.user.value.id.isEmpty) {
                    // Display a message when no data is found
                    return Text(
                      'Your Name',
                      style: Theme.of(context).textTheme.headlineSmall!.apply(color: MColors.white),
                    );
                  } else {
                    // Display User Name
                    return Text(
                      userController.user.value.fullName,
                      style: Theme.of(context).textTheme.headlineSmall!.apply(color: MColors.white),
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
      actions: const [MCartCounterIcon(iconColor: MColors.white, counterBgColor: MColors.black, counterTextColor: MColors.white)],
    );
  }
}
