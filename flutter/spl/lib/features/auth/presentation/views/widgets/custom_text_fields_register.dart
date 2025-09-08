import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/components/background_text_fields_component.dart';
import 'package:spl/core/utils/components/text_form_field_with_prefix_and_suffix_icons_and_hint_and_up_text_component.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomTextFieldsRegister extends StatefulWidget {
  const CustomTextFieldsRegister({
    super.key,
    required this.emailTextEditingController,
    required this.passwordTextEditingController,
    required this.fullNameTextEditingController,
    required this.phoneTextEditingController,
  });
  final TextEditingController emailTextEditingController,
      passwordTextEditingController,
      fullNameTextEditingController,
      phoneTextEditingController;

  @override
  State<CustomTextFieldsRegister> createState() =>
      _CustomTextFieldsRegisterState();
}

class _CustomTextFieldsRegisterState extends State<CustomTextFieldsRegister> {
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
    double height = MediaQuery.sizeOf(context).height;
    getOnBoolValueFromSharedPreferences();
    return BackgroundTextFieldsComponent(
      child: Column(
        children: [
          TextFormFieldWithPrefixAndSuffixIconsAndHintAndUpTextComponent(
            text: isSelected == true ? 'اسم' : 'Name',
            textEditingController: widget.fullNameTextEditingController,
            hintText: isSelected == true ? 'محمد' : 'Mohammad',
            prefixIcon: Assets.images.personImage.path,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return isSelected == true
                    ? 'حقل الاسم مطلوب'
                    : 'The name field\'s required';
              }
              return null;
            },
          ),
          SizedBox(height: height * 0.02),
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
          SizedBox(height: height * 0.02),
          TextFormFieldWithPrefixAndSuffixIconsAndHintAndUpTextComponent(
            text: isSelected == true ? 'كلمة المرور' : 'Password',
            textEditingController: widget.passwordTextEditingController,
            hintText: '******',
            keyboardType: TextInputType.visiblePassword,
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
          SizedBox(height: height * 0.02),
          Padding(
            padding: EdgeInsets.only(bottom: height * 0.02),
            child:
                TextFormFieldWithPrefixAndSuffixIconsAndHintAndUpTextComponent(
                  text: isSelected == true ? 'هاتف' : 'Phone',
                  textEditingController: widget.phoneTextEditingController,
                  hintText: '0912344321',
                  keyboardType: TextInputType.phone,
                  prefixIcon: Assets.images.phoneImage.path,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return isSelected == true
                          ? 'حقل الهاتف مطلوب'
                          : 'The phone field\'s required';
                    } else if (value.length != 10) {
                      return isSelected == true
                          ? 'يجب أن يكون رقم الهاتف 10 أرقام'
                          : 'The phone number should be 10 numbers';
                    }
                    return null;
                  },
                ),
          ),
        ],
      ),
    );
  }
}
