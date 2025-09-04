import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/divider_component.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/features/auth/presentation/views/widgets/custom_app_bar_success_reset_password.dart';
import 'package:spl/features/auth/presentation/views/widgets/custom_image_texts_card_success_reset_password_section.dart';

class CustomSuccessResetPasswordViewBody extends StatelessWidget {
  const CustomSuccessResetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBoxHeight.height21(context: context),
        const CustomAppBarSuccessResetPassword(),
        SizedBoxHeight.heightExpanded,
        const CustomImageTextsCardSuccessResetPasswordSection(),
        SizedBoxHeight.heightExpanded,
        const DividerComponent(
          color: StyleToColors.deepBlueColor,
          thickness: 3,
          percentEndIndent: 0.29,
          percentEndent: 0.29,
        ),
        SizedBoxHeight.height10(context: context),
      ],
    );
  }
}
