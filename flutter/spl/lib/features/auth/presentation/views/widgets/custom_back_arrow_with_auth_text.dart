import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/back_arrow_image_component.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_width.dart';

class CustomBackArrowWithAuthText extends StatelessWidget {
  const CustomBackArrowWithAuthText({
    super.key,
    this.imageColor,
    required this.textAuth,
    required this.textStyle,
  });
  final Color? imageColor;
  final String textAuth;
  final TextStyle textStyle;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BackArrowImageComponent(imageColor: imageColor),
        SizedBoxWidth.width20(context: context),
        Text(textAuth, style: textStyle),
      ],
    );
  }
}
