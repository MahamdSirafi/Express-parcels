import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/back_arrow_image_component.dart';
import 'package:spl/core/utils/components/custom_text_bold_26.dart';
import 'package:spl/core/utils/components/text_medium_14_component.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/core/utils/components/left_padding_component.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';

class CustomAppBarForgetPassword extends StatelessWidget {
  const CustomAppBarForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const LeftPaddingComponent(
          leftPercent: 0.035,
          child: BackArrowImageComponent(),
        ),
        SizedBoxHeight.height21(context: context),
        const TextBold26Component(text: 'Forget Password'),
        SizedBoxHeight.height8(context: context),
        const TextMedium14Component(
          text: 'Please, Enter your email here',
          color: StyleToColors.silverColor,
        ),
        const TextMedium14Component(
          text: 'to reset your password',
          color: StyleToColors.silverColor,
        ),
      ],
    );
  }
}
