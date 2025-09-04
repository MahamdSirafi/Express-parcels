import 'package:flutter/material.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/components/text_bold_16_component.dart';

class CustomTextButtonTrackShipment extends StatelessWidget {
  const CustomTextButtonTrackShipment({
    super.key,
    this.borderSide,
    this.backgroundColor,
    required this.text,
    required this.textColor,
    required this.onPressed,
  });
  final Color? borderSide, backgroundColor;
  final String text;
  final Color textColor;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor ?? StyleToColors.whiteColor,
        minimumSize: Size(size.width * 0.28, size.height * 0.075),
        side: BorderSide(color: borderSide ?? StyleToColors.transparentColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size.height * 0.027),
        ),
      ),
      onPressed: onPressed,
      child: TextBold16Component(text: text, color: textColor),
    );
  }
}
