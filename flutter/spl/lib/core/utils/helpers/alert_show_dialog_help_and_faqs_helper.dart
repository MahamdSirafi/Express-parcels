import 'package:flutter/material.dart';
import 'package:spl/features/help_and_faqs/presentation/views/widgets/custom_alert_dialog_help_and_faqs.dart';

void alertShowDialogHelpAndFaqsHelper({required BuildContext context}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    //this attribute make the dialog doesn't close when i click on any place in view just on the buttons in dialog will work
    builder: (context) {
      return const CustomAlertDialogHelpAndFaqs();
    },
  );
}
