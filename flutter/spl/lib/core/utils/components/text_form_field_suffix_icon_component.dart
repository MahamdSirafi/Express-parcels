import 'package:flutter/material.dart';
import 'package:spl/core/utils/helpers/outline_input_border_text_field_without_label_helper.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';

class TextFormFieldSuffixIconComponent extends StatelessWidget {
  const TextFormFieldSuffixIconComponent({
    super.key,
    this.validator,
    this.onTap,
    required this.hintText,
    required this.suffixIcon,
  });
  final String? Function(String?)? validator;
  final String hintText, suffixIcon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      cursorColor: StyleToColors.blackColor,
      style: StyleToTexts.textStyleNormal14(
        context: context,
      ).copyWith(color: StyleToColors.mediumGreyColor),
      decoration: InputDecoration(
        filled: true,
        fillColor: StyleToColors.whiteColor,
        border: outlineInputBorderTextFieldWithoutLabelHelper(context: context),
        enabledBorder: outlineInputBorderTextFieldWithoutLabelHelper(
          context: context,
        ),
        focusedBorder: outlineInputBorderTextFieldWithoutLabelHelper(
          context: context,
        ),
        hintText: hintText,
        hintStyle: StyleToTexts.textStyleNormal14(
          context: context,
        ).copyWith(color: StyleToColors.mediumGreyColor),
        suffixIcon: GestureDetector(
          onTap: onTap,
          child: Image.asset(suffixIcon),
        ),
      ),
    );
  }
}
