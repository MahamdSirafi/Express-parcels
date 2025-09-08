import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/helpers/outline_input_border_text_field_with_label_helper.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomTextFormFieldResetPassword extends StatefulWidget {
  const CustomTextFormFieldResetPassword({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.textEditingController,
  });
  final String hintText, labelText;
  final TextEditingController textEditingController;

  @override
  State<CustomTextFormFieldResetPassword> createState() =>
      _CustomTextFormFieldResetPasswordState();
}

class _CustomTextFormFieldResetPasswordState
    extends State<CustomTextFormFieldResetPassword> {
  bool? isSelected = false;
  Future<void> getOnBoolValueFromSharedPreferences() async {
    isSelected =
        await BoolSharedPreferencesClass.getBoolParameterSharedPreferences(
          keyBool: kStringKeyFlutterSwitchInSharedPreferences,
        );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    getOnBoolValueFromSharedPreferences();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.035),
      child: TextFormField(
        controller: widget.textEditingController,
        keyboardType: TextInputType.visiblePassword,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return isSelected == true
                ? 'هذا الحقل مطلوب'
                : 'This field\'s required';
          } else if (value.length <= 5) {
            return isSelected == true
                ? 'يجب أن تتكون كلمة المرور الجديدة من 6 أحرف على الأقل'
                : 'The new password should be 6 letters at least';
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
          hintText: widget.hintText,
          labelText: widget.labelText,
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
