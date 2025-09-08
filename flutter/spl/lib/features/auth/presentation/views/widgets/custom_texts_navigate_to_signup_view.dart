import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/components/text_medium_10_component.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/helpers/push_go_router_helper.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';
import 'package:spl/core/utils/components/text_button_with_just_text.dart';

class CustomTextsNavigateToSignupView extends StatefulWidget {
  const CustomTextsNavigateToSignupView({super.key});

  @override
  State<CustomTextsNavigateToSignupView> createState() =>
      _CustomTextsNavigateToSignupViewState();
}

class _CustomTextsNavigateToSignupViewState
    extends State<CustomTextsNavigateToSignupView> {
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextMedium10Component(
          text:
              isSelected == true
                  ? 'إذا لم يكن لديك حساب،'
                  : 'If you don\'t have an account,',
          color: StyleToColors.blackColor,
        ),
        TextButtonWithJustText(
          text: isSelected == true ? 'اشتراك' : 'Sign Up',
          onPressed: () {
            pushGoRouterHelper(context: context, view: kRegisterViewRouter);
          },
          style: StyleToTexts.textStyleMedium10(
            context: context,
          ).copyWith(color: StyleToColors.redColor),
        ),
      ],
    );
  }
}
