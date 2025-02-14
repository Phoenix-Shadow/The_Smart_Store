import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class MShadowStyle {
  static final verticalProductShadow = BoxShadow(
    color: MColors.darkGrey.withAlpha(0x1A),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2)
  );
  static final horizontalProductShadow = BoxShadow(
    color: MColors.darkGrey.withAlpha(0x1A),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2)
  );
}
