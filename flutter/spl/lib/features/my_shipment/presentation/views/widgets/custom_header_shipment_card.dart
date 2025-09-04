import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/dot_component.dart';
import 'package:spl/core/utils/components/text_medium_14_component.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_width.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/features/my_shipment/presentation/views/widgets/custom_rate_text_button_my_shipment.dart';
import 'package:spl/core/utils/components/text_normal_10_component.dart';

class CustomHeaderShipmentCard extends StatelessWidget {
  const CustomHeaderShipmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const TextMedium14Component(
          text: 'Clothes',
          color: StyleToColors.blackColor,
        ),
        SizedBoxWidth.widthExpanded,
        CustomTextButtonMyShipment(),
        SizedBoxWidth.width13(context: context),
        const TextNormal10Component(text: 'Delivered'),
        SizedBoxWidth.width5(context: context),
        const DotComponent(color: StyleToColors.littleNeonGreenColor),
      ],
    );
  }
}
