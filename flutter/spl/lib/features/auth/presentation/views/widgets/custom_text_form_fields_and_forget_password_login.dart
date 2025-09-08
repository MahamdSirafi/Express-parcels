import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/helpers/push_go_router_helper.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';
import 'package:spl/core/utils/components/text_button_with_just_text.dart';
import 'package:spl/core/utils/components/background_text_fields_component.dart';
import 'package:spl/core/utils/components/text_form_field_with_prefix_and_suffix_icons_and_hint_and_up_text_component.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomTextFormFieldsAndForgetPasswordLogin extends StatefulWidget {
  const CustomTextFormFieldsAndForgetPasswordLogin({
    super.key,
    required this.emailTextEditingController,
    required this.passwordTextEditingController,
  });
  final TextEditingController emailTextEditingController,
      passwordTextEditingController;

  @override
  State<CustomTextFormFieldsAndForgetPasswordLogin> createState() =>
      _CustomTextFormFieldsAndForgetPasswordLoginState();
}

class _CustomTextFormFieldsAndForgetPasswordLoginState
    extends State<CustomTextFormFieldsAndForgetPasswordLogin> {
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
    getOnBoolValueFromSharedPreferences();
    return BackgroundTextFieldsComponent(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextFormFieldWithPrefixAndSuffixIconsAndHintAndUpTextComponent(
            text:
                isSelected == true
                    ? 'عنوان البريد الإلكتروني'
                    : 'Email Address',
            textEditingController: widget.emailTextEditingController,
            keyboardType: TextInputType.emailAddress,
            hintText:
                isSelected == true ? 'مثال@gmail.com' : 'example@gmail.com',
            prefixIcon: Assets.images.emailImage.path,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return isSelected == true
                    ? 'حقل البريد الإلكتروني مطلوب'
                    : 'The email field\'s required';
              } else if (!value.contains('@gmail.com')) {
                return isSelected == true
                    ? 'يجب عليك إضافة @gmail.com'
                    : 'You must add @gmail.com';
              }
              return null;
            },
          ),
          SizedBoxHeight.height13(context: context),
          TextFormFieldWithPrefixAndSuffixIconsAndHintAndUpTextComponent(
            text: isSelected == true ? 'كلمة المرور' : 'Password',
            textEditingController: widget.passwordTextEditingController,
            keyboardType: TextInputType.visiblePassword,
            hintText: '******',
            prefixIcon: Assets.images.keyImage.path,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return isSelected == true
                    ? 'حقل كلمة المرور مطلوب'
                    : 'The password field\'s required';
              } else if (value.length <= 5) {
                return isSelected == true
                    ? 'يجب أن تكون كلمة المرور مكونة من 6 أحرف على الأقل'
                    : 'The password should be 6 letters at least';
              }
              return null;
            },
          ),
          TextButtonWithJustText(
            text: isSelected == true ? 'نسيت كلمة المرور؟' : 'Forget Password?',
            onPressed: () {
              pushGoRouterHelper(
                context: context,
                view: kForgetPasswordViewRouter,
              );
            },
            style: StyleToTexts.textStyleNormal10(context: context),
          ),
        ],
      ),
    );
  }
}
