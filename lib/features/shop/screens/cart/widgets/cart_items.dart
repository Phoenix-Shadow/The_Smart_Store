import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/products/cart/add_remove_cart_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/texts/m_product_price_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/product/cart_controller.dart';

class MCartItems extends StatelessWidget {
  const MCartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final cartItems = cartController.cartItems;
    return Obx(
      () {
        return ListView.separated(
          shrinkWrap: true,
          itemCount: cartItems.length,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => const SizedBox(height: MSizes.spaceBtwSections),
          itemBuilder: (context, index) {
            return Obx(
              () {
                final item = cartItems[index];
                return Column(
                  children: [
                    /// -- Cart Items
                    MCartItem(item: item),
                    if (showAddRemoveButtons) const SizedBox(height: MSizes.spaceBtwItems),

                    /// -- Add Remove Buttons and Price Total
                    if (showAddRemoveButtons)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /// -- Add Remove Buttons
                          Row(
                            children: [
                              // Use to add space to the left of Buttons as image space.
                              const SizedBox(width: 70),

                              /// Add Remove Buttons
                              MProductQuantityWithAddRemoveButton(
                                width: 32,
                                height: 32,
                                iconSize: MSizes.md,
                                addBackgroundColor: MColors.primary,
                                removeForegroundColor: MHelperFunctions.isDarkMode(context) ? MColors.white : MColors.black,
                                removeBackgroundColor: MHelperFunctions.isDarkMode(context) ? MColors.darkerGrey : MColors.light,
                                quantity: item.quantity,
                                add: () => cartController.addOneToCart(item),
                                remove: () => cartController.removeOneFromCart(item),
                              ),
                            ],
                          ),

                          /// -- Product total price
                          MProductPriceText(price: (item.price * item.quantity).toStringAsFixed(1)),
                        ],
                      )
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}
