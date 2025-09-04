import 'package:flutter/material.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';
import 'package:spl/core/utils/components/text_normal_10_component.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomTextsAndImageAlertDialogHelpAndFaqsSection extends StatelessWidget {
  const CustomTextsAndImageAlertDialogHelpAndFaqsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Alert', style: StyleToTexts.textStyleBold24(context: context)),
        SizedBoxHeight.height15(context: context),
        Assets.images.alertPersonImage.image(),
        SizedBoxHeight.height15(context: context),
        const TextNormal10Component(
          text: 'Your account has been permanently deleted.',
          textColor: StyleToColors.greyColor,
        ),
        const TextNormal10Component(
          text: 'You will no longer be able to log in using this information.',
          textColor: StyleToColors.greyColor,
        ),
      ],
    );
  }
}
