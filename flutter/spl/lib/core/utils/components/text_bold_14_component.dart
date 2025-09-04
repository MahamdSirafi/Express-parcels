import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/left_padding_component.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';

class TextBold14Component extends StatelessWidget {
  const TextBold14Component({
    super.key,
    required this.text,
    this.percent,
    this.color,
  });
  final String text;
  final Color? color;
  final double? percent;
  @override
  Widget build(BuildContext context) {
    return LeftPaddingComponent(
      leftPercent: percent ?? 0.0,
      child: Text(
        text,
        style: StyleToTexts.textStyleBold14(
          context: context,
        ).copyWith(color: color ?? StyleToColors.blackColor),
      ),
    );
  }
}
