import 'package:flutter/material.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';

class TextNormal8Component extends StatelessWidget {
  const TextNormal8Component({
    super.key,
    required this.text,
    this.textColor,
    this.textAlign,
    this.maxLines,
    this.textOverflow,
  });
  final String text;
  final TextAlign? textAlign;
  final Color? textColor;
  final int? maxLines;
  final TextOverflow? textOverflow;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: textOverflow,
      style: StyleToTexts.textStyleNormal8(
        context: context,
      ).copyWith(color: textColor),
    );
  }
}
