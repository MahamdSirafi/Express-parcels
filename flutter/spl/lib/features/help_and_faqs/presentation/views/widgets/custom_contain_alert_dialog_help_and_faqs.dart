import 'package:flutter/material.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/features/help_and_faqs/presentation/views/widgets/custom_button_alert_dialog_help_and_faqs.dart';
import 'package:spl/features/help_and_faqs/presentation/views/widgets/custom_texts_and_image_alert_dialog_help_and_faqs_section.dart';

class CustomContainAlertDialogHelpAndFaqs extends StatelessWidget {
  const CustomContainAlertDialogHelpAndFaqs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBoxHeight.height23(context: context),
        const CustomTextsAndImageAlertDialogHelpAndFaqsSection(),
        SizedBoxHeight.height20(context: context),
        const CustomButtonAlertDialogHelpAndFaqs(),
        SizedBoxHeight.height40(context: context),
      ],
    );
  }
}
