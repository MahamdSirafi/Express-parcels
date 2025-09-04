import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/text_normal_8_component.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_width.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/components/text_normal_10_component.dart';

class CustomTwoTextShipmentCard extends StatelessWidget {
  const CustomTwoTextShipmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const TextNormal10Component(text: 'Tracking number'),
        SizedBoxWidth.width4(context: context),
        const TextNormal8Component(
          text: '#SY123456',
          textColor: StyleToColors.littleGreyLevel2Color,
        ),
      ],
    );
  }
}
