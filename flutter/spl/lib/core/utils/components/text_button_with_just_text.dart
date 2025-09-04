import 'package:flutter/material.dart';

class TextButtonWithJustText extends StatelessWidget {
  const TextButtonWithJustText({
    super.key,
    required this.text,
    required this.onPressed,
    required this.style,
  });
  final String text;
  final void Function()? onPressed;
  final TextStyle style;
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child: Text(text, style: style));
  }
}
