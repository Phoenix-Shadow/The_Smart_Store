import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/brand_model.dart';
import '../../../features/shop/screens/brand/brand.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import '../shimmers/shimmer.dart';
import 'brand_card.dart';

/// A widget showcasing a brand with its top 3 product images.
class MBrandShowcase extends StatelessWidget {
  /// Default constructor for the MBrandShowcase.
  ///
  /// Parameters:
  ///   - brand: The brand model to display.
  ///   - images: The list of top 3 product images for the brand.
  const MBrandShowcase({super.key, required this.brand, required this.images});

  final BrandModel brand;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(BrandScreen(brand: brand)),
      child: MRoundedContainer(
        margin: const EdgeInsets.only(bottom: MSizes.spaceBtwItems),
        showBorder: true,
        borderColor: MColors.darkGrey,
        backgroundColor: Colors.transparent,
        child: Column(
          children: [
            /// Brand with Products Count
            MBrandCard(showBorder: false, brand: brand),
            const SizedBox(height: MSizes.spaceBtwItems / 2),

            /// Brand Top 3 Product Images
            Row(children: images.map((e) => brandTopProductImageWidget(e, context)).toList()),
          ],
        ),
      ),
    );
  }

  /// Widget to display a top product image for the brand.
  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: MRoundedContainer(
        height: 100,
        padding: const EdgeInsets.all(MSizes.md),
        margin: const EdgeInsets.only(right: MSizes.sm),
        backgroundColor: MHelperFunctions.isDarkMode(context) ? MColors.darkerGrey : MColors.light,
        child: CachedNetworkImage(
          fit: BoxFit.contain,
          imageUrl: image,
          progressIndicatorBuilder: (context, url, downloadProgress) => const MShimmerEffect(width: 100, height: 100),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
