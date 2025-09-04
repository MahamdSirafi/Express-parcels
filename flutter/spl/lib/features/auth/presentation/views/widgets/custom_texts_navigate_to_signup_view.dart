import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/text_medium_10_component.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/helpers/push_go_router_helper.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';
import 'package:spl/core/utils/components/text_button_with_just_text.dart';

class CustomTextsNavigateToSignupView extends StatelessWidget {
  const CustomTextsNavigateToSignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const TextMedium10Component(
          text: 'If you don\'t have an account,',
          color: StyleToColors.blackColor,
        ),
        TextButtonWithJustText(
          text: 'Sign Up',
          onPressed: () {
            pushGoRouterHelper(context: context, view: kRegisterViewRouter);
          },
          style: StyleToTexts.textStyleMedium10(
            context: context,
          ).copyWith(color: StyleToColors.redColor),
        ),
      ],
    );
  }
}
