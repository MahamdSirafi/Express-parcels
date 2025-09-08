import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/components/back_arrow_image_component.dart';
import 'package:spl/core/utils/components/left_padding_component.dart';
import 'package:spl/core/utils/components/text_bold_20_component.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';

class CustomAppBarHelpAndFaqs extends StatefulWidget {
  const CustomAppBarHelpAndFaqs({super.key});

  @override
  State<CustomAppBarHelpAndFaqs> createState() =>
      _CustomAppBarHelpAndFaqsState();
}

class _CustomAppBarHelpAndFaqsState extends State<CustomAppBarHelpAndFaqs> {
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const LeftPaddingComponent(
          leftPercent: 0.037,
          child: BackArrowImageComponent(),
        ),
        SizedBoxHeight.height10(context: context),
        LeftPaddingComponent(
          leftPercent: 0.073,
          child: TextBold20Component(
            text:
                isSelected == true
                    ? 'المساعدة والأسئلة الشائعة'
                    : 'Help & FAQ\'S',
            color: StyleToColors.blackColor,
          ),
        ),
      ],
    );
  }
}
