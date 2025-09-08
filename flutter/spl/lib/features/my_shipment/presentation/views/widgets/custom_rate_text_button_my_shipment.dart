import 'package:flutter/material.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';

class CustomTextButtonMyShipment extends StatelessWidget {
  const CustomTextButtonMyShipment({
    super.key,
    required this.text,
    required this.borderColor,
    required this.textColor,
    required this.onPressed,
  });
  final String text;
  final Color borderColor, textColor;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: size.height * 0.038,
      width: size.width * 0.19,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: StyleToColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(size.height * 0.02),
            side: BorderSide(color: borderColor),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: StyleToTexts.textStyleBold10(
            context: context,
          ).copyWith(color: textColor),
        ),
      ),
    );
  }
}
