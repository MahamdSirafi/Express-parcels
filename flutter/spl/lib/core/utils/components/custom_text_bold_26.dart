import 'package:flutter/material.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';

class TextBold26Component extends StatelessWidget {
  const TextBold26Component({
    super.key,
    required this.text,
    this.color,
    this.decorationColor,
    this.textDecoration,
  });
  final String text;
  final Color? color, decorationColor;
  final TextDecoration? textDecoration;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: StyleToTexts.textStyleBold26(context: context).copyWith(
        color: color,
        decoration: textDecoration,
        decorationColor: decorationColor,
      ),
    );
  }
}
