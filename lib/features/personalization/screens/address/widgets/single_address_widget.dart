import 'package:the_smart_store_user/common/widgets/icons/m_circular_icon.dart';
import 'package:the_smart_store_user/features/personalization/screens/address/update_address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/address_controller.dart';
import '../../../models/address_model.dart';

class MSingleAddress extends StatelessWidget {
  const MSingleAddress({
    super.key,
    required this.address,
    required this.onTap,
    required this.isBillingAddress,
  });

  final AddressModel address;
  final VoidCallback onTap;
  final bool isBillingAddress;

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    final dark = MHelperFunctions.isDarkMode(context);
    return Obx(
      () {
        String selectedAddressId = '';
        selectedAddressId = isBillingAddress ? controller.selectedBillingAddress.value.id : controller.selectedAddress.value.id;
        final isAddressSelected = selectedAddressId == address.id;
        return GestureDetector(
          onTap: onTap,
          child: MRoundedContainer(
            showBorder: true,
            padding: const EdgeInsets.all(MSizes.md),
            width: double.infinity,
            backgroundColor: isAddressSelected ? MColors.primary.withAlpha(0x1A) : Colors.transparent,
            borderColor: isAddressSelected
                ? Colors.transparent
                : dark
                    ? MColors.darkerGrey
                    : MColors.grey,
            margin: const EdgeInsets.only(bottom: MSizes.spaceBtwItems),
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  top: 0,
                  child: TCircularIcon(
                    backgroundColor: MColors.primary.withOpacity(0.6),
                    width: 42,
                    height: 42,
                    size: MSizes.md,
                    color: Colors.white,
                    icon: Iconsax.edit_24,
                    onPressed: () => Get.to(() => UpdateAddressScreen(address: address)),
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      isAddressSelected ? Iconsax.tick_circle1 : Iconsax.tick_circle1,
                      color: isAddressSelected
                          ? MColors.primary
                          : dark
                              ? MColors.darkerGrey
                              : MColors.grey,
                    ),
                    const SizedBox(width: MSizes.spaceBtwItems),
                    Expanded(
                      child: SizedBox(
                        height: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                address.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                            const SizedBox(height: MSizes.sm / 2),
                            Text(address.formattedPhoneNo, maxLines: 1, overflow: TextOverflow.ellipsis),
                            const SizedBox(height: MSizes.sm / 2),
                            Expanded(
                              child: Text(
                                address.toString(),
                                softWrap: true,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
