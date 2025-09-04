import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/back_arrow_image_component.dart';
import 'package:spl/core/utils/components/left_padding_component.dart';
import 'package:spl/core/utils/components/text_bold_20_component.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';

class CustomAppBarHelpAndFaqs extends StatelessWidget {
  const CustomAppBarHelpAndFaqs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const LeftPaddingComponent(
          leftPercent: 0.037,
          child: BackArrowImageComponent(),
        ),
        SizedBoxHeight.height10(context: context),
        const LeftPaddingComponent(
          leftPercent: 0.073,
          child: TextBold20Component(
            text: 'Help & FAQ\'S',
            color: StyleToColors.blackColor,
          ),
        ),
      ],
    );
  }
}
