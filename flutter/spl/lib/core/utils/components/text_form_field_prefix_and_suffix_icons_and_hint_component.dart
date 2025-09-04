import 'package:flutter/material.dart';
import 'package:spl/core/utils/helpers/outline_input_border_text_field_without_label_helper.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';

class TextFormFieldWithPrefixAndSuffixIconsAndHintComponent
    extends StatelessWidget {
  const TextFormFieldWithPrefixAndSuffixIconsAndHintComponent({
    super.key,
    required this.hintText,
    this.textEditingController,
    this.validator,
    this.keyboardType,
    this.onTap,
    this.prefixIcon,
    this.onChanged,
    this.suffixIcon,
  });
  final TextInputType? keyboardType;
  final String hintText;
  final void Function()? onTap;
  final String? suffixIcon, prefixIcon;
  final String? Function(String?)? validator;
  final TextEditingController? textEditingController;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: textEditingController,
      keyboardType: keyboardType ?? TextInputType.name,
      validator: validator,
      cursorColor: StyleToColors.mediumSkyBlueColor,
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
        prefixIcon: prefixIcon != null ? Image.asset(prefixIcon!) : null,
        suffixIcon:
            suffixIcon != null
                ? GestureDetector(onTap: onTap, child: Image.asset(suffixIcon!))
                : null,
      ),
    );
  }
}
