import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/back_arrow_image_component.dart';
import 'package:spl/core/utils/components/left_padding_component.dart';
import 'package:spl/core/utils/components/two_texts_bold_26_component.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';

class BackArrowWithTwoTextsComponent extends StatelessWidget {
  const BackArrowWithTwoTextsComponent({
    super.key,
    required this.firstText,
    required this.secondText,
  });
  final String firstText, secondText;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const LeftPaddingComponent(
          leftPercent: 0.037,
          child: BackArrowImageComponent(),
        ),
        SizedBoxHeight.height10(context: context),
        Align(
          alignment: Alignment.centerLeft,
          child: TwoTextsBold26Component(
            firstText: firstText,
            secondText: secondText,
          ),
        ),
      ],
    );
  }
}
