import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/text_bold_22_component.dart';
import 'package:spl/core/utils/components/text_medium_14_component.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/features/auth/presentation/views/widgets/custom_app_bar_reset_password.dart';
import 'package:spl/features/auth/presentation/views/widgets/custom_text_form_fields_and_card_reset_password_section.dart';

class CustomResetPasswordViewBody extends StatelessWidget {
  const CustomResetPasswordViewBody({super.key, required this.token});
  final String token;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBoxHeight.height21(context: context),
          const CustomAppBarResetPassword(),
          SizedBoxHeight.height72(context: context),
          const TextBold22Component(
            text: 'Reset Password',
            color: StyleToColors.blackColor,
          ),
          SizedBoxHeight.height8(context: context),
          const TextMedium14Component(
            text: 'Please, Enter your new password',
            color: StyleToColors.littleSilverColor,
          ),
          SizedBoxHeight.height21(context: context),
          CustomTextFormFieldsAndCardResetPasswordSection(token: token),
        ],
      ),
    );
  }
}
