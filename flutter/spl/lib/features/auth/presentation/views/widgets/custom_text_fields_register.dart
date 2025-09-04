import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/background_text_fields_component.dart';
import 'package:spl/core/utils/components/text_form_field_with_prefix_and_suffix_icons_and_hint_and_up_text_component.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomTextFieldsRegister extends StatelessWidget {
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
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return BackgroundTextFieldsComponent(
      child: Column(
        children: [
          TextFormFieldWithPrefixAndSuffixIconsAndHintAndUpTextComponent(
            text: 'Name',
            textEditingController: fullNameTextEditingController,
            hintText: 'Mohammad',
            prefixIcon: Assets.images.personImage.path,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'The name field\'s required';
              }
              return null;
            },
          ),
          SizedBox(height: height * 0.02),
          TextFormFieldWithPrefixAndSuffixIconsAndHintAndUpTextComponent(
            text: 'Email Address',
            textEditingController: emailTextEditingController,
            keyboardType: TextInputType.emailAddress,
            hintText: 'example@gmail.com',
            prefixIcon: Assets.images.emailImage.path,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'The email field\'s required';
              } else if (!value.contains('@gmail.com')) {
                return 'You must add @gmail.com';
              }
              return null;
            },
          ),
          SizedBox(height: height * 0.02),
          TextFormFieldWithPrefixAndSuffixIconsAndHintAndUpTextComponent(
            text: 'Password',
            textEditingController: passwordTextEditingController,
            hintText: '******',
            keyboardType: TextInputType.visiblePassword,
            prefixIcon: Assets.images.keyImage.path,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'The password field\'s required';
              } else if (value.length <= 5) {
                return 'The password should be 6 letters at least';
              }
              return null;
            },
          ),
          SizedBox(height: height * 0.02),
          Padding(
            padding: EdgeInsets.only(bottom: height * 0.02),
            child:
                TextFormFieldWithPrefixAndSuffixIconsAndHintAndUpTextComponent(
                  text: 'Phone',
                  textEditingController: phoneTextEditingController,
                  hintText: '0912344321',
                  keyboardType: TextInputType.phone,
                  prefixIcon: Assets.images.phoneImage.path,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'The phone field\'s required';
                    } else if (value.length != 10) {
                      return 'The phone number should be 10 numbers';
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
