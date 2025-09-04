import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/text_bold_12_component.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';

class CustomTextButtonSeeAll extends StatelessWidget {
  const CustomTextButtonSeeAll({super.key, required this.onPressed});
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: StyleToColors.deepBlueColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(height * 0.027),
        ),
        minimumSize: Size(0, height * 0.03),
        //the change from height, no effect from width inside Row
      ),
      onPressed: onPressed,
      child: const TextBold12Component(
        text: 'See all',
        color: StyleToColors.whiteColor,
      ),
    );
  }
}
