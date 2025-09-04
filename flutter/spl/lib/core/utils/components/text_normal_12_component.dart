import 'package:flutter/material.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';

class TextNormal12Component extends StatelessWidget {
  const TextNormal12Component({
    super.key,
    required this.text,
    this.textAlign,
    this.color,
  });
  final String text;
  final TextAlign? textAlign;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: StyleToTexts.textStyleNormal12(
        context: context,
      ).copyWith(color: color ?? StyleToColors.greyColor),
    );
  }
}
