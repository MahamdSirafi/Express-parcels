import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/divider_component.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/features/splash/presentation/views/widgets/custom_two_auth_text_button.dart';

class CustomAuthButtonsAndDividerSection extends StatelessWidget {
  const CustomAuthButtonsAndDividerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTwoAuthTextButton(),
        SizedBoxHeight.height10(context: context),
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
