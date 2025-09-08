import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/components/back_arrow_image_component.dart';
import 'package:spl/core/utils/components/custom_text_bold_26.dart';
import 'package:spl/core/utils/components/text_medium_14_component.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/core/utils/components/left_padding_component.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';

class CustomAppBarForgetPassword extends StatefulWidget {
  const CustomAppBarForgetPassword({super.key});

  @override
  State<CustomAppBarForgetPassword> createState() =>
      _CustomAppBarForgetPasswordState();
}

class _CustomAppBarForgetPasswordState
    extends State<CustomAppBarForgetPassword> {
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
        const LeftPaddingComponent(
          leftPercent: 0.035,
          child: BackArrowImageComponent(),
        ),
        SizedBoxHeight.height21(context: context),
        TextBold26Component(
          text: isSelected == true ? 'نسيت كلمة المرور' : 'Forget Password',
        ),
        SizedBoxHeight.height8(context: context),
        TextMedium14Component(
          text:
              isSelected == true
                  ? 'من فضلك أدخل بريدك الإلكتروني هنا'
                  : 'Please, Enter your email here',
          color: StyleToColors.silverColor,
        ),
        TextMedium14Component(
          text:
              isSelected == true
                  ? 'لإعادة تعيين كلمة المرور الخاصة بك'
                  : 'to reset your password',
          color: StyleToColors.silverColor,
        ),
      ],
    );
  }
}
