import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/text_bold_16_component.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';
import 'package:spl/features/auth/presentation/views/widgets/custom_back_arrow_with_auth_text.dart';
import 'package:spl/core/utils/components/left_padding_component.dart';

class CustomAppBarRegisterView extends StatelessWidget {
  const CustomAppBarRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return LeftPaddingComponent(
      leftPercent: 0.035,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomBackArrowWithAuthText(
            textAuth: 'Sign Up',
            textStyle: StyleToTexts.textStyleBold23(
              context: context,
            ).copyWith(color: StyleToColors.blackColor),
          ),
          SizedBoxHeight.height19(context: context),
          const LeftPaddingComponent(
            leftPercent: 0.02,
            child: TextBold16Component(text: 'Create your account now'),
          ),
          LeftPaddingComponent(
            leftPercent: 0.02,
            child: Text(
              'on your app and track your parcel',
              style: StyleToTexts.textStyleNormal14(context: context),
            ),
          ),
        ],
      ),
    );
  }
}
