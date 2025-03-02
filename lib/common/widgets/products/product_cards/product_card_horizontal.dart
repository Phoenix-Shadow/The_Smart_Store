import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../features/shop/controllers/product/product_controller.dart';
import '../../../../features/shop/models/product_model.dart';
import '../../../../features/shop/screens/product_detail/product_detail.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../images/m_rounded_image.dart';
import '../../texts/m_brand_title_text_with_verified_icon.dart';
import '../../texts/m_product_title_text.dart';
import '../favourite_icon/favourite_icon.dart';
import 'widgets/add_to_cart_button.dart';
import 'widgets/product_card_pricing_widget.dart';
import 'widgets/product_sale_tag.dart';

class MProductCardHorizontal extends StatelessWidget {
  const MProductCardHorizontal({super.key, required this.product, this.isNetworkImage = true});

  final ProductModel product;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    final salePercentage = ProductController.instance.calculateSalePercentage(product.price, product.salePrice);
    final isDark = MHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(product: product)),

      /// Container with side paddings, color, edges, radius and shadow.
      child: Container(
        width: 310,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MSizes.productImageRadius),
          color: MHelperFunctions.isDarkMode(context) ? MColors.darkerGrey : MColors.lightContainer,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Thumbnail
            MRoundedContainer(
              height: 120,
              padding: const EdgeInsets.all(MSizes.sm),
              backgroundColor: isDark ? MColors.dark : MColors.light,
              child: Stack(
                children: [
                  /// -- Thumbnail Image
                  MRoundedImage(width: 120, height: 120, imageUrl: product.thumbnail, isNetworkImage: isNetworkImage),

                  /// -- Sale Tag
                  if (salePercentage != null) ProductSaleTagWidget(salePercentage: salePercentage),

                  /// -- Favourite Icon Button
                  Positioned(
                    top: 0,
                    right: 0,
                    child: MFavouriteIcon(productId: product.id),
                  ),
                ],
              ),
            ),
            const SizedBox(height: MSizes.spaceBtwItems / 2),

            /// -- Details, Add to Cart, & Pricing
            Container(
              padding: const EdgeInsets.only(left: MSizes.sm),
              width: 172,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// -- Details
                  Padding(
                    padding: const EdgeInsets.only(top: MSizes.sm),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MProductTitleText(
                          title: product.title,
                          smallSize: true,
                          maxLines: 2,
                        ),
                        const SizedBox(height: MSizes.spaceBtwItems / 2),
                        MBrandTitleWithVerifiedIcon(title: product.brand!.name, brandTextSize: TextSizes.small),
                      ],
                    ),
                  ),

                  /// Price & Add to cart button
                  /// Use Spacer() to utilize all the space and set the price and cart button at the bottom.
                  /// This usually happens when Product title is in single line or 2 lines (Max)
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Pricing
                      PricingWidget(product: product),

                      /// Add to cart
                      ProductCardAddToCartButton(product: product),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
