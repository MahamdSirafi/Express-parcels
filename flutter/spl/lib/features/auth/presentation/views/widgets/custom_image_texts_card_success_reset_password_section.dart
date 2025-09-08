import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/components/text_bold_24_component.dart';
import 'package:spl/core/utils/components/text_medium_14_component.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/helpers/go_go_router_helper.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/components/card_contain_on_text_component.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomImageTextsCardSuccessResetPasswordSection extends StatefulWidget {
  const CustomImageTextsCardSuccessResetPasswordSection({super.key});

  @override
  State<CustomImageTextsCardSuccessResetPasswordSection> createState() =>
      _CustomImageTextsCardSuccessResetPasswordSectionState();
}

class _CustomImageTextsCardSuccessResetPasswordSectionState
    extends State<CustomImageTextsCardSuccessResetPasswordSection> {
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
    double width = MediaQuery.sizeOf(context).width;
    getOnBoolValueFromSharedPreferences();
    return Column(
      children: [
        Assets.images.greenCheckImage.image(),
        SizedBoxHeight.height10(context: context),
        TextBold24Component(
          text:
              isSelected == true ? 'إعادة تعيين كلمة المرور' : 'Password Reset',
          color: StyleToColors.blackColor,
        ),
        SizedBoxHeight.height10(context: context),
        TextMedium14Component(
          text:
              isSelected == true
                  ? 'لقد تم تغيير كلمة المرور الخاصة بك'
                  : 'Your password has been changed',
          color: StyleToColors.littleDeepGreenColor,
        ),
        SizedBoxHeight.height21(context: context),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.07),
          child: CardContainOnTextComponent(
            text:
                isSelected == true ? 'اذهب إلى الصفحة الرئيسية' : 'Go to Home',
            onTap:
                () => goGoRouterHelper(context: context, view: kHomeViewRouter),
          ),
        ),
      ],
    );
  }
}
