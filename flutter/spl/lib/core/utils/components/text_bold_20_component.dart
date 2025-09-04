import 'package:flutter/material.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';

class TextBold20Component extends StatelessWidget {
  const TextBold20Component({super.key, required this.text, this.color});
  final String text;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: StyleToTexts.textStyleBold20(
        context: context,
      ).copyWith(color: color ?? StyleToColors.blackColor),
    );
  }
}
