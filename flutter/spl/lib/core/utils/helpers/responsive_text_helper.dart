import 'package:flutter/material.dart';
import 'package:spl/core/utils/helpers/get_scale_factor_helper.dart';

double responsiveTextHelper({
  required double fontSize,
  required BuildContext context,
}) {
  double scaleFactor = getScaleFactorHelper(context: context);
  double newFontSize = fontSize * scaleFactor;
  double upperLimit = fontSize * 1.2;
  double lowerLimit = fontSize * 0.8;
  return newFontSize.clamp(lowerLimit, upperLimit);
}
