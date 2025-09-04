import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/text_medium_20_component.dart';

class TextButtonWithStyleComponent extends StatelessWidget {
  const TextButtonWithStyleComponent({
    super.key,
    required this.backgroundColor,
    required this.onPressed,
    this.borderSide,
    required this.textColor,
    required this.text,
  });
  final Color backgroundColor, textColor;
  final Color? borderSide;
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return TextButton(
      style: TextButton.styleFrom(
        side: BorderSide(color: borderSide ?? Colors.transparent),
        backgroundColor: backgroundColor,
        minimumSize: Size(double.infinity, height * 0.08),
      ),
      onPressed: onPressed,
      child: TextMedium20Component(text: text, color: textColor),
    );
  }
}
