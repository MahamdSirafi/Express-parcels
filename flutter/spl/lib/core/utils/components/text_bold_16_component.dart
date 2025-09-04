import 'package:flutter/material.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';

class TextBold16Component extends StatelessWidget {
  const TextBold16Component({
    super.key,
    required this.text,
    this.color,
    this.maxLines,
    this.textOverflow,
  });
  final String text;
  final Color? color;
  final int? maxLines;
  final TextOverflow? textOverflow;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: textOverflow,
      style: StyleToTexts.textStyleBold16(
        context: context,
      ).copyWith(color: color),
    );
  }
}
