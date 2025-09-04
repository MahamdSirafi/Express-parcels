import 'package:flutter/material.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';

class TextMedium12Component extends StatelessWidget {
  const TextMedium12Component({super.key, required this.text, this.color});
  final String text;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: StyleToTexts.textStyleMedium12(
        context: context,
      ).copyWith(color: color),
    );
  }
}
