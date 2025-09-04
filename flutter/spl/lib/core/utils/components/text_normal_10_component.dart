import 'package:flutter/material.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';

class TextNormal10Component extends StatelessWidget {
  const TextNormal10Component({super.key, required this.text, this.textColor});
  final String text;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: StyleToTexts.textStyleNormal10(
        context: context,
      ).copyWith(color: textColor ?? StyleToColors.mediumGreyColor),
    );
  }
}
