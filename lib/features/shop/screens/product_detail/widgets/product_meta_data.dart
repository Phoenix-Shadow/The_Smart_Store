import 'package:flutter/material.dart';
import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/images/m_circular_image.dart';
import '../../../../../common/widgets/texts/m_brand_title_text_with_verified_icon.dart';
import '../../../../../common/widgets/texts/m_product_price_text.dart';
import '../../../../../common/widgets/texts/m_product_title_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/enums.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/product/product_controller.dart';
import '../../../models/product_model.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = ProductController.instance.calculateSalePercentage(product.price, product.salePrice);
    final darkMode = MHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & Sale Price
        Row(
          children: [
            /// -- Sale Tag
            if (salePercentage != null)
              Row(
                children: [
                  MRoundedContainer(
                    backgroundColor: MColors.secondary,
                    radius: MSizes.sm,
                    padding: const EdgeInsets.symmetric(horizontal: MSizes.sm, vertical: MSizes.xs),
                    child: Text('$salePercentage%',
                        style: Theme.of(context).textTheme.labelLarge!.apply(color: MColors.black)),
                  ),
                  const SizedBox(width: MSizes.spaceBtwItems)
                ],
              ),


            // Actual Price if sale price not null.
            if ((product.productVariations == null || product.productVariations!.isEmpty) && product.salePrice> 0.0)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.price.toString(), style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
                  const SizedBox(width: MSizes.spaceBtwItems)
                ],
              ),

            // Price, Show sale price as main price if sale exist.
            MProductPriceText(price: controller.getProductPrice(product), isLarge: true),
          ],
        ),
        const SizedBox(height: MSizes.spaceBtwItems / 1.5),
        MProductTitleText(title: product.title),
        const SizedBox(height: MSizes.spaceBtwItems / 1.5),
        Row(
          children: [
            const MProductTitleText(title: 'Stock : ', smallSize: true),
            Text(controller.getProductStockStatus(product), style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: MSizes.spaceBtwItems / 2),

        /// Brand
        Row(
          children: [
            MCircularImage(
              width: 32,
              height: 32,
              isNetworkImage: true,
              image: product.brand!.image,
              overlayColor: darkMode ? MColors.white : MColors.black,
            ),
            MBrandTitleWithVerifiedIcon(title: product.brand!.name, brandTextSize: TextSizes.medium),
          ],
        ),
      ],
    );
  }
}
