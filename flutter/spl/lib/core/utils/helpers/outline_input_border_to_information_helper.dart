import 'package:flutter/material.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';

OutlineInputBorder outlineInputBorderToInformationHelper({
  required BuildContext context,
}) {
  double height = MediaQuery.sizeOf(context).height;
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(height * 0.021),
    borderSide: const BorderSide(color: StyleToColors.greyColor),
  );
}
