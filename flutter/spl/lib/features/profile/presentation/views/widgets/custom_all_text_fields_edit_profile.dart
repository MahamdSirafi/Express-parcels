import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/components/text_form_field_prefix_and_suffix_icons_and_hint_component.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomAllTextFieldsEditProfile extends StatefulWidget {
  const CustomAllTextFieldsEditProfile({
    super.key,
    required this.fullNameTextEditingController,
    required this.emailTextEditingController,
    required this.phoneTextEditingController,
  });
  final TextEditingController fullNameTextEditingController,
      emailTextEditingController,
      phoneTextEditingController;

  @override
  State<CustomAllTextFieldsEditProfile> createState() =>
      _CustomAllTextFieldsEditProfileState();
}

class _CustomAllTextFieldsEditProfileState
    extends State<CustomAllTextFieldsEditProfile> {
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
    return Column(
      children: [
        TextFormFieldWithPrefixAndSuffixIconsAndHintComponent(
          hintText: isSelected == true ? 'محمد' : 'Mohammad',
          textEditingController: widget.fullNameTextEditingController,
          prefixIcon: Assets.images.personImage.path,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return isSelected == true
                  ? 'حقل الاسم مطلوب'
                  : 'The name field\'s required';
            }
            return null;
          },
          suffixIcon: Assets.images.penImage.path,
        ),
        SizedBoxHeight.height10(context: context),
        TextFormFieldWithPrefixAndSuffixIconsAndHintComponent(
          hintText: isSelected == true ? 'مثال@gmail.com' : 'example@gmail.com',
          textEditingController: widget.emailTextEditingController,
          keyboardType: TextInputType.emailAddress,
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
          suffixIcon: Assets.images.penImage.path,
        ),
        SizedBoxHeight.height10(context: context),
        TextFormFieldWithPrefixAndSuffixIconsAndHintComponent(
          hintText: '0966778899',
          keyboardType: TextInputType.phone,
          textEditingController: widget.phoneTextEditingController,
          prefixIcon: Assets.images.phoneImage.path,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return isSelected == true
                  ? 'حقل الهاتف مطلوب'
                  : 'The phone field\'s required';
            } else if (value.length < 10 || value.length > 10) {
              return isSelected == true
                  ? 'يجب أن يكون الهاتف 10 أرقام'
                  : 'The phone should be 10 numbers';
            }
            return null;
          },
          suffixIcon: Assets.images.penImage.path,
        ),
      ],
    );
  }
}
