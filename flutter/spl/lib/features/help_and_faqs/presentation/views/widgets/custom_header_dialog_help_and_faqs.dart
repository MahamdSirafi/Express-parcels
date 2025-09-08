import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/components/text_bold_20_component.dart';
import 'package:spl/core/utils/components/text_normal_10_component.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';

class CustomHeaderDialogHelpAndFaqs extends StatefulWidget {
  const CustomHeaderDialogHelpAndFaqs({super.key});

  @override
  State<CustomHeaderDialogHelpAndFaqs> createState() =>
      _CustomHeaderDialogHelpAndFaqsState();
}

class _CustomHeaderDialogHelpAndFaqsState
    extends State<CustomHeaderDialogHelpAndFaqs> {
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
          text: isSelected == true ? 'حذف الحساب' : 'Delete Account',
          color: StyleToColors.blackColor,
        ),
        TextNormal10Component(
          text:
              isSelected == true
                  ? 'هل تريد حذف حسابك من التطبيق؟'
                  : 'Do you want to delete your account from the application?',
          textColor: StyleToColors.greyColor,
        ),
      ],
    );
  }
}
