import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/text_normal_16_component.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/components/text_normal_8_component.dart';

class CustomCommentTextsInMyRatingCard extends StatelessWidget {
  const CustomCommentTextsInMyRatingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextNormal16Component(text: 'Comment:'),
        SizedBoxHeight.height10(context: context),
        const TextNormal8Component(
          text: 'This review was sent after receiving package #SY.111.',
          textColor: StyleToColors.mediumRedColor,
        ),
        const TextNormal8Component(
          text: 'This review was last modified on 04/22/2025.',
          textColor: StyleToColors.mediumRedColor,
        ),
      ],
    );
  }
}
