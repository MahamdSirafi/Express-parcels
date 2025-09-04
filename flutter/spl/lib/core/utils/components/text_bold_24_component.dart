import 'package:flutter/material.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';

class TextBold24Component extends StatelessWidget {
  const TextBold24Component({super.key, required this.text, this.color});
  final String text;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: StyleToTexts.textStyleBold24(
        context: context,
      ).copyWith(color: color ?? StyleToColors.whiteColor),
    );
  }
}
