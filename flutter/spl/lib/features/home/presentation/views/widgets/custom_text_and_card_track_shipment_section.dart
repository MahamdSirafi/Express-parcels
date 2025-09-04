import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/custom_text_bold_26.dart';

class CustomTextAndCardTrackShipmentSection extends StatelessWidget {
  const CustomTextAndCardTrackShipmentSection({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.only(
        left: size.width * 0.09,
        bottom: size.height * 0.01,
      ),
      child: const Align(
        alignment: Alignment.centerLeft,
        child: TextBold26Component(text: 'Home'),
      ),
    );
  }
}
