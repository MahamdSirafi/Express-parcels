import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/text_normal_8_component.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_width.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomAnotherTextsAndImageInRatingCard extends StatelessWidget {
  const CustomAnotherTextsAndImageInRatingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'SY.1111',
          style: StyleToTexts.textStyleNormal14(
            context: context,
          ).copyWith(color: StyleToColors.greyColor),
        ),
        SizedBoxWidth.width15(context: context),
        Assets.images.dateImage.svg(),
        SizedBoxWidth.width6(context: context),
        const TextNormal8Component(text: '24.05.2025'),
      ],
    );
  }
}
