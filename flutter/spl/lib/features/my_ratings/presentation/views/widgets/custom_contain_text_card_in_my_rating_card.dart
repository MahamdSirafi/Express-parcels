import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/text_normal_8_component.dart';

class CustomContainTextCardInMyRatingCard extends StatelessWidget {
  const CustomContainTextCardInMyRatingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextNormal8Component(
          text:
              'The package arrived in good condition, and communication 0was clear.',
        ),
        TextNormal8Component(text: '0was clear.'),
      ],
    );
  }
}
