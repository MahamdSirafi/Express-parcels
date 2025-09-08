import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/components/back_arrow_image_component.dart';
import 'package:spl/core/utils/components/left_padding_component.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/components/custom_text_bold_26.dart';

class CustomAppBarPrivacyPolicy extends StatefulWidget {
  const CustomAppBarPrivacyPolicy({super.key});

  @override
  State<CustomAppBarPrivacyPolicy> createState() =>
      _CustomAppBarPrivacyPolicyState();
}

class _CustomAppBarPrivacyPolicyState extends State<CustomAppBarPrivacyPolicy> {
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
          leftPercent: 0.035,
          child: BackArrowImageComponent(),
        ),
        SizedBoxHeight.height10(context: context),
        LeftPaddingComponent(
          leftPercent: 0.07,
          child: TextBold26Component(
            text: isSelected == true ? 'إعدادات' : 'Settings',
            color: StyleToColors.deepBlueColor,
          ),
        ),
        LeftPaddingComponent(
          leftPercent: 0.07,
          child: TextBold26Component(
            text: isSelected == true ? 'سياسة الخصوصية' : 'Privacy Policy',
          ),
        ),
      ],
    );
  }
}
