import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/custom_text_bold_26.dart';
import 'package:spl/core/utils/components/left_padding_component.dart';

class TwoTextsBold26Component extends StatelessWidget {
  const TwoTextsBold26Component({
    super.key,
    required this.firstText,
    required this.secondText,
  });
  final String firstText, secondText;
  @override
  Widget build(BuildContext context) {
    return LeftPaddingComponent(
      leftPercent: 0.07,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextBold26Component(text: firstText),
          TextBold26Component(text: secondText),
        ],
      ),
    );
  }
}
