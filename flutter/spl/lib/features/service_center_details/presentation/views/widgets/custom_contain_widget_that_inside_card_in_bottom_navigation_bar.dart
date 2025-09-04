import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/text_bold_16_component.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_width.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomContainWidgetThatInsideCardInBottomNavigationBar
    extends StatelessWidget {
  const CustomContainWidgetThatInsideCardInBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Assets.images.phoneImage.image(),
        SizedBoxWidth.width15(context: context),
        const TextBold16Component(
          text: 'Call Now',
          color: StyleToColors.deepBlueColor,
        ),
      ],
    );
  }
}
