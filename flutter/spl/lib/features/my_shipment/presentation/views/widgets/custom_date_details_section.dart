import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/text_normal_8_component.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_width.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/components/text_normal_10_component.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomDateDetailsSection extends StatelessWidget {
  const CustomDateDetailsSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Assets.images.dateImage.svg(
          colorFilter: const ColorFilter.mode(
            StyleToColors.deepBlueColor,
            BlendMode.srcIn,
          ),
        ),
        SizedBoxWidth.width9(context: context),
        const TextNormal10Component(text: 'Creation date'),
        SizedBoxWidth.width5(context: context),
        const TextNormal8Component(
          text: '24.05.2025',
          textColor: StyleToColors.deepBlueColor,
        ),
      ],
    );
  }
}
