import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/helpers/go_go_router_helper.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/features/help_and_faqs/presentation/views/widgets/custom_text_button_help_and_faqs.dart';

class CustomButtonAlertDialogHelpAndFaqs extends StatefulWidget {
  const CustomButtonAlertDialogHelpAndFaqs({super.key});

  @override
  State<CustomButtonAlertDialogHelpAndFaqs> createState() =>
      _CustomButtonAlertDialogHelpAndFaqsState();
}

class _CustomButtonAlertDialogHelpAndFaqsState
    extends State<CustomButtonAlertDialogHelpAndFaqs> {
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
    return CustomTextButtonHelpAndFaqs(
      backgroundColor: StyleToColors.greyColor,
      text: isSelected == true ? 'العودة إلى البداية' : 'Back to Start',
      textColor: StyleToColors.mediumRedColor,
      onPressed:
          () => goGoRouterHelper(context: context, view: kSplashViewRouter),
    );
  }
}
