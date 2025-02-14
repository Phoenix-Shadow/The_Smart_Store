import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/images/m_circular_image.dart';
import '../../../../common/widgets/shimmers/shimmer.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/user_controller.dart';
import 'change_name.dart';
import 'widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: MAppBar(
        showBackArrow: true,
        title: Text('Profile', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(
                      () {
                        final networkImage = controller.user.value.profilePicture;
                        final image = networkImage.isNotEmpty ? networkImage : MImages.user;
                        return controller.imageUploading.value
                            ? const MShimmerEffect(width: 80, height: 80, radius: 80)
                            : MCircularImage(image: image, width: 80, height: 80, isNetworkImage: networkImage.isNotEmpty);
                      },
                    ),
                    TextButton(
                      onPressed: controller.imageUploading.value ? () {} : () => controller.uploadUserProfilePicture(),
                      child: const Text('Change Profile Picture'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: MSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: MSizes.spaceBtwItems),
              const MSectionHeading(title: 'Profile Information', showActionButton: false),
              const SizedBox(height: MSizes.spaceBtwItems),
              MProfileMenu(onPressed: () => Get.to(() => const ChangeName()), title: 'Name', value: controller.user.value.fullName),
              MProfileMenu(onPressed: () {}, title: 'Username', value: controller.user.value.username),
              const SizedBox(height: MSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: MSizes.spaceBtwItems),
              const MSectionHeading(title: 'Personal Information', showActionButton: false),
              const SizedBox(height: MSizes.spaceBtwItems),
              MProfileMenu(onPressed: () {}, title: 'User ID', value: '45689', icon: Iconsax.copy),
              MProfileMenu(onPressed: () {}, title: 'E-mail', value: controller.user.value.email),
              MProfileMenu(onPressed: () {}, title: 'Phone Number', value: controller.user.value.phoneNumber),
              MProfileMenu(onPressed: () {}, title: 'Gender', value: 'Male'),
              MProfileMenu(onPressed: () {}, title: 'Date of Birth', value: '1 Jan, 1900'),
              const Divider(),
              const SizedBox(height: MSizes.spaceBtwItems),
              Center(
                child: TextButton(
                    onPressed: () => controller.deleteAccountWarningPopup(),
                    child: const Text('Close Account', style: TextStyle(color: Colors.red))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
