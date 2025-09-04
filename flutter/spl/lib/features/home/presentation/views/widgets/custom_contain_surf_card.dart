import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/text_normal_10_component.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_width.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomContainSurfCard extends StatelessWidget {
  const CustomContainSurfCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBoxWidth.widthExpanded,
        const TextNormal10Component(
          text: 'Surf',
          textColor: StyleToColors.blackColor,
        ),
        SizedBoxWidth.widthExpanded,
        Assets.images.rightArrowDirectionImage.image(),
      ],
    );
  }
}
