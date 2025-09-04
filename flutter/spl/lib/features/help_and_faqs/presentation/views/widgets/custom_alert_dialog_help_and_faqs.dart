import 'package:flutter/material.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/features/help_and_faqs/presentation/views/widgets/custom_contain_alert_dialog_help_and_faqs.dart';

class CustomAlertDialogHelpAndFaqs extends StatelessWidget {
  const CustomAlertDialogHelpAndFaqs({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(size.height * 0.033),
      ),
      backgroundColor: StyleToColors.whiteColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.045),
        child: const CustomContainAlertDialogHelpAndFaqs(),
      ),
    );
  }
}
