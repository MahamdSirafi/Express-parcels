import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/text_button_with_just_text.dart';
import 'package:spl/core/utils/constants/double_variables_constant.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_width.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';

class CustomContainDetailsProfile extends StatelessWidget {
  const CustomContainDetailsProfile({
    super.key,
    required this.image,
    required this.text,
    required this.onPressed,
    this.percentHeightImage,
  });
  final String image, text;
  final double? percentHeightImage;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Row(
      children: [
        Image.asset(image, height: height * (percentHeightImage ?? 0.034)),
        SizedBoxWidth.width23(context: context),
        TextButtonWithJustText(
          text: text,
          onPressed: onPressed,
          style: StyleToTexts.textStyleNormal18(context: context),
        ),
        SizedBoxWidth.widthExpanded,
        Transform.rotate(
          angle: kAngleRightDirection,
          child: const Icon(Icons.arrow_back_ios),
        ),
      ],
    );
  }
}
