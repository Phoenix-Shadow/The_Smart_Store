import 'package:the_smart_store_user/features/personalization/controllers/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../models/payment_method_model.dart';
import '../../screens/checkout/widgets/payment_tile.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final settingsController = Get.put(SettingsController());
  final Rx<PaymentMethodModel> selectedPaymentMethod = PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value = PaymentMethodModel(name: PaymentMethods.paypal.name, image: MImages.paypal);
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(MSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MSectionHeading(title: 'Select Payment Method', showActionButton: false),
              const SizedBox(height: MSizes.spaceBtwSections),
              MPaymentTile(paymentMethod: PaymentMethodModel(name: PaymentMethods.paypal.name, image: MImages.paypal)),
              const SizedBox(height: MSizes.spaceBtwItems / 2),
              MPaymentTile(paymentMethod: PaymentMethodModel(name: 'Google Pay', image: MImages.googlePay)),
              const SizedBox(height: MSizes.spaceBtwItems / 2),
              MPaymentTile(paymentMethod: PaymentMethodModel(name: 'Apple Pay', image: MImages.applePay)),
              const SizedBox(height: MSizes.spaceBtwItems / 2),
              MPaymentTile(paymentMethod: PaymentMethodModel(name: 'VISA', image: MImages.visa)),
              const SizedBox(height: MSizes.spaceBtwItems / 2),
              MPaymentTile(paymentMethod: PaymentMethodModel(name: 'Master Card', image: MImages.masterCard)),
              const SizedBox(height: MSizes.spaceBtwItems / 2),
              MPaymentTile(paymentMethod: PaymentMethodModel(name: 'Paytm', image: MImages.paytm)),
              const SizedBox(height: MSizes.spaceBtwItems / 2),
              MPaymentTile(paymentMethod: PaymentMethodModel(name: 'Paystack', image: MImages.paystack)),
              const SizedBox(height: MSizes.spaceBtwItems / 2),
              MPaymentTile(paymentMethod: PaymentMethodModel(name: 'Credit Card', image: MImages.creditCard)),
              const SizedBox(height: MSizes.spaceBtwItems / 2),
              const SizedBox(height: MSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }

  bool isShippingFree(double subTotal) {
    if (settingsController.settings.value.freeShippingThreshold != null && settingsController.settings.value.freeShippingThreshold! > 0.0) {
      if (subTotal > settingsController.settings.value.freeShippingThreshold!) {
        return true;
      }
    }
    return false;
  }

  double getShippingCost(double subTotal) {
    return isShippingFree(subTotal) ? 0 : settingsController.settings.value.shippingCost;
  }

  double getTaxAmount(double subTotal) {
    return settingsController.settings.value.taxRate * subTotal;
  }

  double getTotal(double subTotal) {
    double taxAmount = subTotal * settingsController.settings.value.taxRate;
    double totalPrice = subTotal + taxAmount + (isShippingFree(subTotal) ? 0 : settingsController.settings.value.shippingCost);
    return double.tryParse(totalPrice.toStringAsFixed(2)) ?? 0.0;
  }
}
