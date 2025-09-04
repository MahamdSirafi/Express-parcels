import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/text_bold_20_component.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_width.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';

class CustomImageWithText extends StatelessWidget {
  const CustomImageWithText({
    super.key,
    required this.image,
    required this.text,
  });
  final String text;
  final Image image;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        image,
        SizedBoxWidth.width7(context: context),
        TextBold20Component(text: text, color: StyleToColors.littlePurpleColor),
      ],
    );
  }
}
