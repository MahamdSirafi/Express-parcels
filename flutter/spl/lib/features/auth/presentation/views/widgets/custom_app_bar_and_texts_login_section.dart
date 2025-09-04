import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/text_bold_24_component.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';
import 'package:spl/features/auth/presentation/views/widgets/custom_app_bar_login_view.dart';
import 'package:spl/features/auth/presentation/views/widgets/custom_right_padding.dart';
import 'package:spl/features/auth/presentation/views/widgets/custom_transform_translate_top.dart';

class CustomAppBarAndTextsLoginSection extends StatelessWidget {
  const CustomAppBarAndTextsLoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const CustomAppBarLoginView(),
        const CustomTransformTranslateTop(
          topPercent: 0.11,
          child: CustomRightPadding(
            rightPercent: 0.07,
            child: TextBold24Component(
              text: 'Welcome back',
              color: StyleToColors.blackColor,
            ),
          ),
        ),
        CustomTransformTranslateTop(
          topPercent: 0.09,
          child: CustomRightPadding(
            rightPercent: 0.035,
            child: Text(
              'Please Login to your account',
              style: StyleToTexts.textStyleNormal14(context: context),
            ),
          ),
        ),
      ],
    );
  }
}
