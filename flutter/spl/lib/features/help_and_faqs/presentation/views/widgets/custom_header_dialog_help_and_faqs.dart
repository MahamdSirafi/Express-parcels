import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/text_bold_20_component.dart';
import 'package:spl/core/utils/components/text_normal_10_component.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';

class CustomHeaderDialogHelpAndFaqs extends StatelessWidget {
  const CustomHeaderDialogHelpAndFaqs({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TextBold20Component(
          text: 'Delete Account',
          color: StyleToColors.blackColor,
        ),
        TextNormal10Component(
          text: 'Do you want to delete your account from the application?',
          textColor: StyleToColors.greyColor,
        ),
      ],
    );
  }
}
