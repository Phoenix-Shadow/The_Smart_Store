import 'package:the_smart_store_user/features/shop/controllers/product/checkout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../common/widgets/products/cart/billing_amount_section.dart';
import '../../../../common/widgets/products/cart/coupon_code.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../../utils/popups/loaders.dart';
import '../../../personalization/controllers/address_controller.dart';
import '../../controllers/product/cart_controller.dart';
import '../../controllers/product/order_controller.dart';
import '../cart/widgets/cart_items.dart';
import 'widgets/billing_address_section.dart';
import 'widgets/billing_payment_section.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final checkoutController = CheckoutController.instance;
    final cartController = CartController.instance;
    final addressController = AddressController.instance;
    final subTotal = cartController.totalCartPrice.value;
    final orderController = Get.put(OrderController());
    final dark = MHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: const MAppBar(title: Text('Order Review'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// -- Items in Cart
              const MCartItems(showAddRemoveButtons: false),
              const SizedBox(height: MSizes.spaceBtwSections),

              /// -- Coupon TextField
              const MCouponCode(),
              const SizedBox(height: MSizes.spaceBtwSections),

              /// -- Billing Section
              MRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(MSizes.md),
                backgroundColor: dark ? MColors.black : MColors.white,
                child: Column(
                  children: [
                    /// Pricing
                    MBillingAmountSection(subTotal: subTotal),
                    const SizedBox(height: MSizes.spaceBtwItems),

                    /// Divider
                    const Divider(),
                    const SizedBox(height: MSizes.spaceBtwItems),

                    /// Payment Methods
                    const TBillingPaymentSection(),
                    const SizedBox(height: MSizes.spaceBtwSections),

                    /// Address
                    const TAddressSection(isBillingAddress: false),
                    const SizedBox(height: MSizes.spaceBtwItems),

                    /// Divider
                    const Divider(),
                    const SizedBox(height: MSizes.spaceBtwItems),

                    /// Address Checkbox
                    Obx(
                      () => CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text('Billing Address is Same as Shipping Address'),
                        value: addressController.billingSameAsShipping.value,
                        onChanged: (value) => addressController.billingSameAsShipping.value = value ?? true,
                      ),
                    ),
                    const SizedBox(height: MSizes.spaceBtwItems),

                    /// Divider
                    Obx(() => !addressController.billingSameAsShipping.value ? const Divider() : const SizedBox.shrink()),

                    /// Shipping Address
                    Obx(() => !addressController.billingSameAsShipping.value
                        ? const TAddressSection(isBillingAddress: true)
                        : const SizedBox.shrink()),
                  ],
                ),
              ),
              const SizedBox(height: MSizes.spaceBtwSections),
            ],
          ),
        ),
      ),

      /// -- Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(MSizes.defaultSpace),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: subTotal > 0
                ? () => orderController.processOrder(subTotal)
                : () => MLoaders.warningSnackBar(title: 'Empty Cart', message: 'Add items in the cart in order to proceed.'),
            child: Text('Checkout \$${checkoutController.getTotal(subTotal).toStringAsFixed(2)}'),
          ),
        ),
      ),
    );
  }
}
