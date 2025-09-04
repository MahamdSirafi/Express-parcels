import 'package:flutter/material.dart';
import 'package:spl/core/utils/helpers/outline_input_border_text_field_with_label_helper.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomTextFormFieldResetPassword extends StatelessWidget {
  const CustomTextFormFieldResetPassword({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.textEditingController,
  });
  final String hintText, labelText;
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.035),
      child: TextFormField(
        controller: textEditingController,
        keyboardType: TextInputType.visiblePassword,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field\'s required';
          } else if (value.length <= 5) {
            return 'The new password should be 6 letters at least';
          }
          return null;
        },
        style: StyleToTexts.textStyleNormal12(context: context),
        decoration: InputDecoration(
          border: outlineInputBorderTextFieldWithLabelHelper(context: context),
          enabledBorder: outlineInputBorderTextFieldWithLabelHelper(
            context: context,
          ),
          focusedBorder: outlineInputBorderTextFieldWithLabelHelper(
            context: context,
          ),
          hintText: hintText,
          labelText: labelText,
          labelStyle: StyleToTexts.textStyleNormal12(
            context: context,
          ).copyWith(color: StyleToColors.blackColor),
          hintStyle: StyleToTexts.textStyleNormal12(context: context),
          suffixIcon: Assets.images.keyImage.image(),
        ),
      ),
    );
  }
}
