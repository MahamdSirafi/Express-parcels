import 'package:flutter/material.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_width.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';

class CustomImageAndTextServiceCenterAndDetailsServiceCenter
    extends StatelessWidget {
  const CustomImageAndTextServiceCenterAndDetailsServiceCenter({
    super.key,
    required this.image,
    required this.text,
  });
  final Image image;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        image,
        SizedBoxWidth.width10(context: context),
        Text(
          text,
          style: StyleToTexts.textStyleNormal12(
            context: context,
          ).copyWith(color: StyleToColors.blackColor),
        ),
      ],
    );
  }
}
