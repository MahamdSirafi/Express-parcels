import 'package:flutter/material.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';

class CustomTextExplainAboutPackageType extends StatelessWidget {
  const CustomTextExplainAboutPackageType({
    super.key,
    required this.description,
  });
  final String description;
  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: StyleToTexts.textStyleNormal8(
        context: context,
      ).copyWith(color: StyleToColors.mediumGreyColor),
    );
  }
}
