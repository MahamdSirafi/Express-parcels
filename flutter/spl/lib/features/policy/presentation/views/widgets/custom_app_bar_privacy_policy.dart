import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/back_arrow_image_component.dart';
import 'package:spl/core/utils/components/left_padding_component.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/components/custom_text_bold_26.dart';

class CustomAppBarPrivacyPolicy extends StatelessWidget {
  const CustomAppBarPrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const LeftPaddingComponent(
          leftPercent: 0.035,
          child: BackArrowImageComponent(),
        ),
        SizedBoxHeight.height10(context: context),
        const LeftPaddingComponent(
          leftPercent: 0.07,
          child: TextBold26Component(
            text: 'Settings',
            color: StyleToColors.deepBlueColor,
          ),
        ),
        const LeftPaddingComponent(
          leftPercent: 0.07,
          child: TextBold26Component(text: 'Privacy Policy'),
        ),
      ],
    );
  }
}
