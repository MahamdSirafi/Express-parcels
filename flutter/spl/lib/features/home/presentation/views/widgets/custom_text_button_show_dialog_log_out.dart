import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/text_bold_22_component.dart';

class CustomTextButtonShowDialogLogOut extends StatelessWidget {
  const CustomTextButtonShowDialogLogOut({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    required this.text,
    required this.onPressed,
  });
  final Color backgroundColor, textColor;
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(height * 0.02),
          ),
        ),
        onPressed: onPressed,
        child: TextBold22Component(text: text, color: textColor),
      ),
    );
  }
}
