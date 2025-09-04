import 'package:flutter/material.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';

class CustomSizePackageLeftSide extends StatelessWidget {
  const CustomSizePackageLeftSide({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: StyleToTexts.textStyleMedium14(
        context: context,
      ).copyWith(color: StyleToColors.blackColor),
    );
  }
}
