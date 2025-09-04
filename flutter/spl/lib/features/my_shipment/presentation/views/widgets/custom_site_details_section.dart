import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/text_normal_10_component.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_width.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomSiteDetailsSection extends StatelessWidget {
  const CustomSiteDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Assets.images.locationBlackImageP.image(),
        SizedBoxWidth.width9(context: context),
        const TextNormal10Component(text: 'Damascus Abbasin'),
      ],
    );
  }
}
