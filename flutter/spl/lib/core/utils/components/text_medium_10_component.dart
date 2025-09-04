import 'package:flutter/material.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';

class TextMedium10Component extends StatelessWidget {
  const TextMedium10Component({super.key, required this.text, this.color});
  final String text;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: StyleToTexts.textStyleMedium10(
        context: context,
      ).copyWith(color: color ?? StyleToColors.littleSilverColor),
    );
  }
}
