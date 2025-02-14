import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../images/m_circular_image.dart';
import '../texts/m_brand_title_text.dart';

/// A widget that displays an image with text below it in a vertical arrangement.
class MVerticalImageAndText extends StatelessWidget {
  /// Constructor for [MVerticalImageAndText].
  const MVerticalImageAndText({
    super.key,
    this.onTap,
    required this.image,
    required this.title,
    this.backgroundColor,
    this.isNetworkImage = true,
    this.textColor = MColors.white,
  });

  /// The image asset path or URL.
  final String image;

  /// The text to be displayed below the image.
  final String title;

  /// The color of the text.
  final Color textColor;

  /// Flag indicating whether the image is loaded from the network.
  final bool isNetworkImage;

  /// The background color of the widget.
  final Color? backgroundColor;

  /// Callback function when the widget is tapped.
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: MSizes.spaceBtwItems),
        child: Column(
          children: [
            MCircularImage(
              image: image,
              fit: BoxFit.fitWidth,
              padding: MSizes.sm * 1.4,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              overlayColor: MHelperFunctions.isDarkMode(context) ? MColors.light : MColors.dark,
            ),
            const SizedBox(height: MSizes.spaceBtwItems / 2),
            SizedBox(width: 55, child: MBrandTitleText(title: title, color: textColor)),
          ],
        ),
      ),
    );
  }
}