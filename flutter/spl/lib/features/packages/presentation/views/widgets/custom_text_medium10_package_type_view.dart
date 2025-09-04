import 'package:flutter/material.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';

class CustomTextMedium10PackageTypeView extends StatelessWidget {
  const CustomTextMedium10PackageTypeView({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: StyleToTexts.textStyleMedium10(
        context: context,
      ).copyWith(color: StyleToColors.mediumGreyColor),
    );
  }
}
