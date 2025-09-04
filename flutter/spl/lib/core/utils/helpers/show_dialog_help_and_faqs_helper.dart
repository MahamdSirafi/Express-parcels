import 'package:flutter/material.dart';
import 'package:spl/features/help_and_faqs/presentation/views/widgets/custom_dialog_help_and_faqs.dart';

void showDialogHelpAndFaqsHelper({required BuildContext context}) {
  showDialog(
    context: context,
    builder: (context) {
      return const CustomDialogHelpAndFaqs();
    },
  );
}
