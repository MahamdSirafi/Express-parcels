import 'package:flutter/material.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';

class TextBold12Component extends StatelessWidget {
  const TextBold12Component({super.key, required this.text, this.color});
  final String text;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: StyleToTexts.textStyleBold12(
        context: context,
      ).copyWith(color: color ?? StyleToColors.littleSkyBlueColor),
    );
  }
}
