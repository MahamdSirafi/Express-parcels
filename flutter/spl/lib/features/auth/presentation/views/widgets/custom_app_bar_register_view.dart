import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/components/text_bold_16_component.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';
import 'package:spl/features/auth/presentation/views/widgets/custom_back_arrow_with_auth_text.dart';
import 'package:spl/core/utils/components/left_padding_component.dart';

class CustomAppBarRegisterView extends StatefulWidget {
  const CustomAppBarRegisterView({super.key});

  @override
  State<CustomAppBarRegisterView> createState() =>
      _CustomAppBarRegisterViewState();
}

class _CustomAppBarRegisterViewState extends State<CustomAppBarRegisterView> {
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
    return LeftPaddingComponent(
      leftPercent: 0.035,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomBackArrowWithAuthText(
            textAuth: isSelected == true ? 'اشتراك' : 'Sign Up',
            textStyle: StyleToTexts.textStyleBold23(
              context: context,
            ).copyWith(color: StyleToColors.blackColor),
          ),
          SizedBoxHeight.height19(context: context),
          LeftPaddingComponent(
            leftPercent: 0.02,
            child: TextBold16Component(
              text:
                  isSelected == true
                      ? 'قم بإنشاء حسابك الآن'
                      : 'Create your account now',
            ),
          ),
          LeftPaddingComponent(
            leftPercent: 0.02,
            child: Text(
              isSelected == true
                  ? 'على تطبيقك وتتبع طردك'
                  : 'on your app and track your parcel',
              style: StyleToTexts.textStyleNormal14(context: context),
            ),
          ),
        ],
      ),
    );
  }
}
