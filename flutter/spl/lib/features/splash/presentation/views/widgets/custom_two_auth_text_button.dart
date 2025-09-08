import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/components/text_button_with_style_component.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/helpers/push_go_router_helper.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';

class CustomTwoAuthTextButton extends StatefulWidget {
  const CustomTwoAuthTextButton({super.key});

  @override
  State<CustomTwoAuthTextButton> createState() =>
      _CustomTwoAuthTextButtonState();
}

class _CustomTwoAuthTextButtonState extends State<CustomTwoAuthTextButton> {
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
    Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.035),
      child: Column(
        children: [
          TextButtonWithStyleComponent(
            backgroundColor: StyleToColors.deepBlueColor,
            onPressed: () {
              pushGoRouterHelper(context: context, view: kLoginViewRouter);
            },
            textColor: StyleToColors.whiteColor,
            text: isSelected == true ? 'تسجيل الدخول' : 'LogIn',
          ),
          SizedBoxHeight.height10(context: context),
          TextButtonWithStyleComponent(
            backgroundColor: StyleToColors.whiteColor,
            onPressed: () {
              pushGoRouterHelper(context: context, view: kRegisterViewRouter);
            },
            borderSide: StyleToColors.deepBlueColor,
            textColor: StyleToColors.deepBlueColor,
            text: isSelected == true ? 'اشتراك' : 'SignUp',
          ),
        ],
      ),
    );
  }
}
