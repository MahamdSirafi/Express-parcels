import 'package:flutter/material.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';

class CustomTextNormal8PackageTypeView extends StatelessWidget {
  const CustomTextNormal8PackageTypeView({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: StyleToTexts.textStyleNormal8(
        context: context,
      ).copyWith(color: StyleToColors.deepBlueColor),
    );
  }
}
