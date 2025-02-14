import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../custom_shapes/containers/rounded_container.dart';

class MCouponCode extends StatelessWidget {
  const MCouponCode({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return MRoundedContainer(
      showBorder: true,
      backgroundColor: isDark ? MColors.dark : MColors.white,
      padding: const EdgeInsets.only(top: MSizes.sm,bottom: MSizes.sm,right: MSizes.sm,left: MSizes.md),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// TextField
          Flexible(
            child: TextFormField(
              expands: false,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: 'Have a promo code? Enter here',
              ),
            ),
          ),
          /// Button
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: isDark ? MColors.white.withOpacity(0.5) : MColors.dark.withOpacity(0.5),
                backgroundColor: Colors.grey.withOpacity(0.2),
                side: BorderSide(color: Colors.grey.withAlpha(0x1A)),
              ),
              child: const Text('Apply'),
            ),
          ),
        ],
      ),
    );
  }
}
