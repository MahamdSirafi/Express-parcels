import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/text_form_field_prefix_and_suffix_icons_and_hint_component.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomAllTextFieldsEditProfile extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormFieldWithPrefixAndSuffixIconsAndHintComponent(
          hintText: 'Mohammad',
          textEditingController: fullNameTextEditingController,
          prefixIcon: Assets.images.personImage.path,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'The name field\'s required';
            }
            return null;
          },
          suffixIcon: Assets.images.penImage.path,
        ),
        SizedBoxHeight.height10(context: context),
        TextFormFieldWithPrefixAndSuffixIconsAndHintComponent(
          hintText: 'example@gmail.com',
          textEditingController: emailTextEditingController,
          keyboardType: TextInputType.emailAddress,
          prefixIcon: Assets.images.emailImage.path,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'The email field\'s required';
            } else if (!value.contains('@gmail.com')) {
              return 'You must add @gmail.com';
            }
            return null;
          },
          suffixIcon: Assets.images.penImage.path,
        ),
        SizedBoxHeight.height10(context: context),
        TextFormFieldWithPrefixAndSuffixIconsAndHintComponent(
          hintText: '0966778899',
          keyboardType: TextInputType.phone,
          textEditingController: phoneTextEditingController,
          prefixIcon: Assets.images.phoneImage.path,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'The phone field\'s required';
            } else if (value.length < 10 || value.length > 10) {
              return 'The phone should be 10 numbers';
            }
            return null;
          },
          suffixIcon: Assets.images.penImage.path,
        ),
      ],
    );
  }
}
