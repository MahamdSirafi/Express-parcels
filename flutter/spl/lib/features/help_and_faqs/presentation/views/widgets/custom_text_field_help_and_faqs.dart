import 'package:flutter/material.dart';
import 'package:spl/core/utils/helpers/help_and_faqs_outline_input_border_helper.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomTextFieldHelpAndFaqs extends StatelessWidget {
  const CustomTextFieldHelpAndFaqs({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: StyleToTexts.textStyleNormal12(
        context: context,
      ).copyWith(color: StyleToColors.littleBrownColor),
      decoration: InputDecoration(
        enabledBorder: helpAndFaqsOutlineInputBorderHelper(context: context),
        focusedBorder: helpAndFaqsOutlineInputBorderHelper(context: context),
        hintText: 'Search',
        hintStyle: StyleToTexts.textStyleNormal12(
          context: context,
        ).copyWith(color: StyleToColors.littleBrownColor),
        suffixIcon: Assets.images.searchImage.image(),
      ),
    );
  }
}
