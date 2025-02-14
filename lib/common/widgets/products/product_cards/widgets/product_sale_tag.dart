import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../custom_shapes/containers/rounded_container.dart';

class ProductSaleTagWidget extends StatelessWidget {
  const ProductSaleTagWidget({
    super.key,
    required this.salePercentage,
  });

  final String? salePercentage;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 12,
      child: MRoundedContainer(
        radius: MSizes.sm,
        backgroundColor: MColors.secondary.withOpacity(0.8),
        padding: const EdgeInsets.symmetric(horizontal: MSizes.sm, vertical: MSizes.xs),
        child: Text('$salePercentage%', style: Theme.of(context).textTheme.labelLarge!.apply(color: MColors.black)),
      ),
    );
  }
}