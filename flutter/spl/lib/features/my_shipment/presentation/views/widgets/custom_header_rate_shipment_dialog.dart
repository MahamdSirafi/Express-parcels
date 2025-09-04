import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/custom_text_bold_26.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/components/text_bold_14_component.dart';

class CustomHeaderRateShipmentDialog extends StatelessWidget {
  const CustomHeaderRateShipmentDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: TextBold26Component(
            text: 'Rate Us',
            color: StyleToColors.deepBlueColor,
            textDecoration: TextDecoration.underline,
            decorationColor: StyleToColors.deepBlueColor,
          ),
        ),
        TextBold14Component(text: 'Rate your shipment', percent: 0.07),
      ],
    );
  }
}
