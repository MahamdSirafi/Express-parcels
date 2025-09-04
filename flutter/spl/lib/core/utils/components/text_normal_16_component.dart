import 'package:flutter/material.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';

class TextNormal16Component extends StatelessWidget {
  const TextNormal16Component({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text, style: StyleToTexts.textStyleNormal16(context: context));
  }
}
