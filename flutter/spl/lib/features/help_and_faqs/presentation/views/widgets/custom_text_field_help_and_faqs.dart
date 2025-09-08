import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/helpers/help_and_faqs_outline_input_border_helper.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomTextFieldHelpAndFaqs extends StatefulWidget {
  const CustomTextFieldHelpAndFaqs({super.key});

  @override
  State<CustomTextFieldHelpAndFaqs> createState() =>
      _CustomTextFieldHelpAndFaqsState();
}

class _CustomTextFieldHelpAndFaqsState
    extends State<CustomTextFieldHelpAndFaqs> {
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
    return TextField(
      style: StyleToTexts.textStyleNormal12(
        context: context,
      ).copyWith(color: StyleToColors.littleBrownColor),
      decoration: InputDecoration(
        enabledBorder: helpAndFaqsOutlineInputBorderHelper(context: context),
        focusedBorder: helpAndFaqsOutlineInputBorderHelper(context: context),
        hintText: isSelected == true ? 'يبحث' : 'Search',
        hintStyle: StyleToTexts.textStyleNormal12(
          context: context,
        ).copyWith(color: StyleToColors.littleBrownColor),
        suffixIcon: Assets.images.searchImage.image(),
      ),
    );
  }
}
