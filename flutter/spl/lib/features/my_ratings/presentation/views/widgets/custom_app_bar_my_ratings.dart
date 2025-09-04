import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/left_padding_component.dart';
import 'package:spl/core/utils/components/text_medium_10_component.dart';

class CustomTwoTextsMyRatings extends StatelessWidget {
  const CustomTwoTextsMyRatings({super.key});

  @override
  Widget build(BuildContext context) {
    return const LeftPaddingComponent(
      leftPercent: 0.073,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextMedium10Component(
            text: 'You can follow your previous and current ratings and',
          ),
          TextMedium10Component(text: 'edit them if you want.'),
        ],
      ),
    );
  }
}
