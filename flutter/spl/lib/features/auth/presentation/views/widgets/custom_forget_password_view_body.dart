import 'package:flutter/material.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/features/auth/presentation/views/widgets/custom_app_bar_forget_password.dart';
import 'package:spl/features/auth/presentation/views/widgets/custom_text_form_field_and_card_and_text_button_section.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomForgetPasswordViewBody extends StatelessWidget {
  const CustomForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBoxHeight.height21(context: context),
          const CustomAppBarForgetPassword(),
          SizedBoxHeight.height60(context: context),
          Assets.images.lockImage.image(),
          SizedBoxHeight.height60(context: context),
          const CustomTextFormFieldAndCardAndTextButtonSection(),
        ],
      ),
    );
  }
}
