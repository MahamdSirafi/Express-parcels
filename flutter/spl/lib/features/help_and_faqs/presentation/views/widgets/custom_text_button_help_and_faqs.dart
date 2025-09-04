import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/text_bold_22_component.dart';

class CustomTextButtonHelpAndFaqs extends StatelessWidget {
  const CustomTextButtonHelpAndFaqs({
    super.key,
    required this.backgroundColor,
    required this.text,
    required this.onPressed,
    this.textColor,
  });
  final Color backgroundColor;
  final Color? textColor;
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return SizedBox(
      height: height * 0.084,
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(height * 0.014),
          ),
        ),
        onPressed: onPressed,
        child: TextBold22Component(text: text, color: textColor),
      ),
    );
  }
}
