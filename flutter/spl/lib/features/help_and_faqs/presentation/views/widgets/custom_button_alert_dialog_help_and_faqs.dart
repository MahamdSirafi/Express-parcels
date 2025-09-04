import 'package:flutter/material.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/helpers/go_go_router_helper.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/features/help_and_faqs/presentation/views/widgets/custom_text_button_help_and_faqs.dart';

class CustomButtonAlertDialogHelpAndFaqs extends StatelessWidget {
  const CustomButtonAlertDialogHelpAndFaqs({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextButtonHelpAndFaqs(
      backgroundColor: StyleToColors.greyColor,
      text: 'Back to Start',
      textColor: StyleToColors.mediumRedColor,
      onPressed:
          () => goGoRouterHelper(context: context, view: kSplashViewRouter),
    );
  }
}
