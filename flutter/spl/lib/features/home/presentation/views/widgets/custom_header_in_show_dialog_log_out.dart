import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/divider_component.dart';
import 'package:spl/core/utils/components/text_bold_20_component.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';

class CustomHeaderInShowDialogLogOut extends StatelessWidget {
  const CustomHeaderInShowDialogLogOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextBold20Component(
          text: 'LogOut',
          color: StyleToColors.blackColor,
        ),
        SizedBoxHeight.height5(context: context),
        const DividerComponent(
          color: StyleToColors.greyColor,
          percentEndIndent: 0.15,
          thickness: 3,
          percentEndent: 0.15,
        ),
        SizedBoxHeight.height10(context: context),
        Text(
          'Are you sure you want to Log out?',
          style: StyleToTexts.textStyleNormal14(
            context: context,
          ).copyWith(color: StyleToColors.greyColor),
        ),
      ],
    );
  }
}
