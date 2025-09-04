import 'package:flutter/material.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';

class CustomParcelTypeText extends StatelessWidget {
  const CustomParcelTypeText({super.key, required this.text});
  final dynamic text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text['text']!,
      style: StyleToTexts.textStyleBold14(
        context: context,
      ).copyWith(color: StyleToColors.littleGreyLevel1Color),
    );
  }
}
