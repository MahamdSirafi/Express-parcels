import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/text_bold_12_component.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_width.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/generator/assets.gen.dart';

class ViewDetailsTextButtonComponent extends StatelessWidget {
  const ViewDetailsTextButtonComponent({super.key, required this.onPressed});
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: StyleToColors.deepBlueColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(height * 0.028),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          const TextBold12Component(
            text: 'View details',
            color: StyleToColors.whiteColor,
          ),
          SizedBoxWidth.width5(context: context),
          Assets.images.rightArrowInsideCircleImage.image(),
        ],
      ),
    );
  }
}
