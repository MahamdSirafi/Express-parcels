import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/text_bold_24_component.dart';
import 'package:spl/core/utils/components/text_medium_14_component.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/helpers/go_go_router_helper.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/components/card_contain_on_text_component.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomImageTextsCardSuccessResetPasswordSection extends StatelessWidget {
  const CustomImageTextsCardSuccessResetPasswordSection({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        Assets.images.greenCheckImage.image(),
        SizedBoxHeight.height10(context: context),
        const TextBold24Component(
          text: 'Password Reset',
          color: StyleToColors.blackColor,
        ),
        SizedBoxHeight.height10(context: context),
        const TextMedium14Component(
          text: 'Your password has been changed',
          color: StyleToColors.littleDeepGreenColor,
        ),
        SizedBoxHeight.height21(context: context),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.07),
          child: CardContainOnTextComponent(
            text: 'Go to Home',
            onTap:
                () => goGoRouterHelper(context: context, view: kHomeViewRouter),
          ),
        ),
      ],
    );
  }
}
