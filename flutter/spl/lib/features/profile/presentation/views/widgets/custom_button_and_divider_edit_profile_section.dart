import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/card_contain_on_text_component.dart';
import 'package:spl/core/utils/components/divider_component.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';

class CustomButtonAndDividerEditProfileSection extends StatelessWidget {
  const CustomButtonAndDividerEditProfileSection({
    super.key,
    required this.formKey,
    required this.onTap,
  });
  final GlobalKey<FormState> formKey;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardContainOnTextComponent(text: 'Save', onTap: onTap),
        const DividerComponent(
          color: StyleToColors.deepBlueColor,
          thickness: 3,
          percentEndIndent: 0.29,
          percentEndent: 0.29,
        ),
      ],
    );
  }
}
