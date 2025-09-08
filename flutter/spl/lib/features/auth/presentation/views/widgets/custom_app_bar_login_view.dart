import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';
import 'package:spl/features/auth/presentation/views/widgets/custom_back_arrow_with_auth_text.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomAppBarLoginView extends StatefulWidget {
  const CustomAppBarLoginView({super.key});

  @override
  State<CustomAppBarLoginView> createState() => _CustomAppBarLoginViewState();
}

class _CustomAppBarLoginViewState extends State<CustomAppBarLoginView> {
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
    getOnBoolValueFromSharedPreferences();
    return Stack(
      children: [
        Assets.images.backgroundLoginImage.image(),
        Positioned(
          top: size.height * 0.04,
          left: size.width * 0.035,
          child: CustomBackArrowWithAuthText(
            imageColor: StyleToColors.whiteColor,
            textAuth: isSelected == true ? 'تسجيل الدخول' : 'LOGIN',
            textStyle: StyleToTexts.textStyleBold23(context: context),
          ),
        ),
      ],
    );
  }
}
