import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/components/text_bold_24_component.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';
import 'package:spl/features/auth/presentation/views/widgets/custom_app_bar_login_view.dart';
import 'package:spl/features/auth/presentation/views/widgets/custom_right_padding.dart';
import 'package:spl/features/auth/presentation/views/widgets/custom_transform_translate_top.dart';

class CustomAppBarAndTextsLoginSection extends StatefulWidget {
  const CustomAppBarAndTextsLoginSection({super.key});

  @override
  State<CustomAppBarAndTextsLoginSection> createState() =>
      _CustomAppBarAndTextsLoginSectionState();
}

class _CustomAppBarAndTextsLoginSectionState
    extends State<CustomAppBarAndTextsLoginSection> {
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
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const CustomAppBarLoginView(),
        CustomTransformTranslateTop(
          topPercent: 0.11,
          child: CustomRightPadding(
            rightPercent: 0.07,
            child: TextBold24Component(
              text: isSelected == true ? 'مرحبًا بعودتك' : 'Welcome back',
              color: StyleToColors.blackColor,
            ),
          ),
        ),
        CustomTransformTranslateTop(
          topPercent: 0.09,
          child: CustomRightPadding(
            rightPercent: 0.035,
            child: Text(
              isSelected == true
                  ? 'الرجاء تسجيل الدخول إلى حسابك'
                  : 'Please Login to your account',
              style: StyleToTexts.textStyleNormal14(context: context),
            ),
          ),
        ),
      ],
    );
  }
}
