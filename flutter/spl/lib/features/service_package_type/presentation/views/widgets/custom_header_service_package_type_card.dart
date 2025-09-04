import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/view_details_text_button_component.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_width.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';

class CustomHeaderServicePackageTypeCard extends StatelessWidget {
  const CustomHeaderServicePackageTypeCard({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text, style: StyleToTexts.textStyleMedium18(context: context)),
        SizedBoxWidth.widthExpanded,
        ViewDetailsTextButtonComponent(onPressed: () {}),
      ],
    );
  }
}
