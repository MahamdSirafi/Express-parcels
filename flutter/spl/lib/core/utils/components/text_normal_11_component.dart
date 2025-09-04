import 'package:flutter/material.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';

class TextNormal11Component extends StatelessWidget {
  const TextNormal11Component({super.key, required this.text, this.color});
  final String text;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: StyleToTexts.textStyleNormal11(
        context: context,
      ).copyWith(color: color ?? StyleToColors.littleGreyColor),
    );
  }
}
