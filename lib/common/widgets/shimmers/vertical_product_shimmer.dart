import 'package:flutter/material.dart';
import '../../../utils/constants/sizes.dart';
import '../layouts/grid_layout.dart';
import 'shimmer.dart';

class MVerticalProductShimmer extends StatelessWidget {
  const MVerticalProductShimmer({
    super.key,
    this.itemCount = 4,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return MGridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) => const SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Image
            MShimmerEffect(width: 180, height: 180),
            SizedBox(height: MSizes.spaceBtwItems),

            /// Text
            MShimmerEffect(width: 160, height: 15),
            SizedBox(height: MSizes.spaceBtwItems / 2),
            MShimmerEffect(width: 110, height: 15),
          ],
        ),
      ),
    );
  }
}
