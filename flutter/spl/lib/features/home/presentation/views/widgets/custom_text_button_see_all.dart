import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/components/text_bold_12_component.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';

class CustomTextButtonSeeAll extends StatefulWidget {
  const CustomTextButtonSeeAll({super.key, required this.onPressed});
  final void Function() onPressed;

  @override
  State<CustomTextButtonSeeAll> createState() => _CustomTextButtonSeeAllState();
}

class _CustomTextButtonSeeAllState extends State<CustomTextButtonSeeAll> {
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
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: StyleToColors.deepBlueColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(height * 0.027),
        ),
        minimumSize: Size(0, height * 0.03),
        //the change from height, no effect from width inside Row
      ),
      onPressed: widget.onPressed,
      child: TextBold12Component(
        text: isSelected == true ? 'انظر الكل' : 'See all',
        color: StyleToColors.whiteColor,
      ),
    );
  }
}
