import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/components/divider_component.dart';
import 'package:spl/core/utils/components/text_bold_20_component.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';

class CustomHeaderInShowDialogLogOut extends StatefulWidget {
  const CustomHeaderInShowDialogLogOut({super.key});

  @override
  State<CustomHeaderInShowDialogLogOut> createState() =>
      _CustomHeaderInShowDialogLogOutState();
}

class _CustomHeaderInShowDialogLogOutState
    extends State<CustomHeaderInShowDialogLogOut> {
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
        TextBold20Component(
          text: isSelected == true ? 'تسجيل الخروج' : 'LogOut',
          color: StyleToColors.blackColor,
        ),
        SizedBoxHeight.height5(context: context),
        const DividerComponent(
          color: StyleToColors.greyColor,
          percentEndIndent: 0.15,
          thickness: 3,
          percentEndent: 0.15,
        ),
        SizedBoxHeight.height10(context: context),
        Text(
          isSelected == true
              ? 'هل أنت متأكد أنك تريد تسجيل الخروج؟'
              : 'Are you sure you want to Log out?',
          style: StyleToTexts.textStyleNormal14(
            context: context,
          ).copyWith(color: StyleToColors.greyColor),
        ),
      ],
    );
  }
}
