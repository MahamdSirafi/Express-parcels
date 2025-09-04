import 'package:flutter/material.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';

OutlineInputBorder outlineInputBorderTextFieldWithLabelHelper({
  required BuildContext context,
}) {
  double height = MediaQuery.sizeOf(context).height;
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(height * 0.025),
    borderSide: const BorderSide(color: StyleToColors.blackColor),
  );
}
