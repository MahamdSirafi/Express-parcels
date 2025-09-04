import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/left_padding_component.dart';
import 'package:spl/core/utils/components/text_medium_20_component.dart';

class CustomHeadDrawer extends StatelessWidget {
  const CustomHeadDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const LeftPaddingComponent(
      leftPercent: 0.083,
      child: TextMedium20Component(text: 'Settings'),
    );
  }
}
