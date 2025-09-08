import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';
import 'package:spl/core/utils/components/text_normal_10_component.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomTextsAndImageAlertDialogHelpAndFaqsSection extends StatefulWidget {
  const CustomTextsAndImageAlertDialogHelpAndFaqsSection({super.key});

  @override
  State<CustomTextsAndImageAlertDialogHelpAndFaqsSection> createState() =>
      _CustomTextsAndImageAlertDialogHelpAndFaqsSectionState();
}

class _CustomTextsAndImageAlertDialogHelpAndFaqsSectionState
    extends State<CustomTextsAndImageAlertDialogHelpAndFaqsSection> {
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
        Text(
          isSelected == true ? 'يُحذًِر' : 'Alert',
          style: StyleToTexts.textStyleBold24(context: context),
        ),
        SizedBoxHeight.height15(context: context),
        Assets.images.alertPersonImage.image(),
        SizedBoxHeight.height15(context: context),
        TextNormal10Component(
          text:
              isSelected == true
                  ? 'لقد تم حذف حسابك نهائيًا.'
                  : 'Your account has been permanently deleted.',
          textColor: StyleToColors.greyColor,
        ),
        TextNormal10Component(
          text:
              isSelected == true
                  ? 'لن تتمكن بعد الآن من تسجيل الدخول باستخدام هذه المعلومات.'
                  : 'You will no longer be able to log in using this information.',
          textColor: StyleToColors.greyColor,
        ),
      ],
    );
  }
}
