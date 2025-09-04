import 'package:flutter/material.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';

class TextMedium16Component extends StatelessWidget {
  const TextMedium16Component({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: StyleToTexts.textStyleMedium16(
        context: context,
      ).copyWith(color: StyleToColors.blackColor),
    );
  }
}
