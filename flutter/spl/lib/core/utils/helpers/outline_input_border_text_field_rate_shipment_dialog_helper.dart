import 'package:flutter/material.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';

OutlineInputBorder outlineInputBorderTextFieldRateShipmentDialogHelper({
  required BuildContext context,
}) {
  double height = MediaQuery.sizeOf(context).height;
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(height * 0.033),
    borderSide: const BorderSide(color: StyleToColors.mediumSkyBlueColor),
  );
}
