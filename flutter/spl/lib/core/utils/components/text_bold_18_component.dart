import 'package:flutter/material.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';

class TextBold18Component extends StatelessWidget {
  const TextBold18Component({
    super.key,
    required this.text,
    this.color,
    this.textAlign,
  });
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: StyleToTexts.textStyleBold18(
        context: context,
      ).copyWith(color: color),
    );
  }
}
