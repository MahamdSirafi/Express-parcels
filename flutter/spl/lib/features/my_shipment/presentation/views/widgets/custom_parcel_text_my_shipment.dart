import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/custom_text_bold_26.dart';
import 'package:spl/core/utils/components/left_padding_component.dart';

class CustomParcelTextMyShipment extends StatelessWidget {
  const CustomParcelTextMyShipment({super.key});

  @override
  Widget build(BuildContext context) {
    return const LeftPaddingComponent(
      leftPercent: 0.08,
      child: Align(
        alignment: Alignment.centerLeft,
        child: TextBold26Component(text: 'My Parcels'),
      ),
    );
  }
}
