import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/back_arrow_image_component.dart';
import 'package:spl/core/utils/components/left_padding_component.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';

class BackArrowWithTextComponent extends StatelessWidget {
  const BackArrowWithTextComponent({
    super.key,
    required this.text,
    this.textStyle,
  });
  final String text;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const LeftPaddingComponent(
          leftPercent: 0.037,
          child: BackArrowImageComponent(),
        ),
        SizedBoxHeight.height15(context: context),
        LeftPaddingComponent(
          leftPercent: 0.074,
          child: Text(
            text,
            style: textStyle ?? StyleToTexts.textStyleBold26(context: context),
          ),
        ),
      ],
    );
  }
}
