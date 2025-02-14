import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: MColors.darkGrey,
    suffixIconColor: MColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: MSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(fontSize: MSizes.fontSizeMd, color: MColors.black, fontFamily: 'Poppins'),
    hintStyle: const TextStyle().copyWith(fontSize: MSizes.fontSizeSm, color: MColors.black, fontFamily: 'Poppins'),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal, fontFamily: 'Poppins'),
    floatingLabelStyle: const TextStyle().copyWith(color: MColors.black.withOpacity(0.8), fontFamily: 'Poppins'),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: MColors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: MColors.grey),
    ),
    focusedBorder:const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: MColors.dark),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: MColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: MColors.warning),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: MColors.darkGrey,
    suffixIconColor: MColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: MSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(fontSize: MSizes.fontSizeMd, color: MColors.white, fontFamily: 'Poppins'),
    hintStyle: const TextStyle().copyWith(fontSize: MSizes.fontSizeSm, color: MColors.white, fontFamily: 'Poppins'),
    floatingLabelStyle: const TextStyle().copyWith(color: MColors.white.withOpacity(0.8), fontFamily: 'Poppins'),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: MColors.darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: MColors.darkGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: MColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: MColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: MColors.warning),
    ),
  );
}
