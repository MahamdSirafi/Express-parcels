import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/text_form_field_prefix_and_suffix_icons_and_hint_component.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';

class TextFormFieldWithPrefixAndSuffixIconsAndHintAndUpTextComponent
    extends StatelessWidget {
  const TextFormFieldWithPrefixAndSuffixIconsAndHintAndUpTextComponent({
    super.key,
    required this.text,
    required this.hintText,
    this.textEditingController,
    this.validator,
    this.keyboardType,
    this.onTap,
    this.prefixIcon,
    this.suffixIcon,
  });
  final String text, hintText;
  final String? suffixIcon, prefixIcon;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  final TextEditingController? textEditingController;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.035),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: size.width * 0.015,
              bottom: size.height * 0.007,
            ),
            child: Text(
              text,
              style: StyleToTexts.textStyleMedium13(context: context),
            ),
          ),
          TextFormFieldWithPrefixAndSuffixIconsAndHintComponent(
            hintText: hintText,
            textEditingController: textEditingController,
            prefixIcon: prefixIcon,
            keyboardType: keyboardType,
            validator: validator,
            onTap: onTap,
            suffixIcon: suffixIcon,
          ),
        ],
      ),
    );
  }
}
