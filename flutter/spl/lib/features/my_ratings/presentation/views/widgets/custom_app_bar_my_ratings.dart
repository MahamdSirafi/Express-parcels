import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/components/left_padding_component.dart';
import 'package:spl/core/utils/components/text_medium_10_component.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';

class CustomTwoTextsMyRatings extends StatefulWidget {
  const CustomTwoTextsMyRatings({super.key});

  @override
  State<CustomTwoTextsMyRatings> createState() =>
      _CustomTwoTextsMyRatingsState();
}

class _CustomTwoTextsMyRatingsState extends State<CustomTwoTextsMyRatings> {
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
      leftPercent: 0.073,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextMedium10Component(
            text:
                isSelected == true
                    ? 'يمكنك متابعة تقييماتك السابقة والحالية'
                    : 'You can follow your previous and current ratings and',
          ),
          TextMedium10Component(
            text:
                isSelected == true
                    ? 'قم بتعديلها إذا كنت تريد ذلك.'
                    : 'edit them if you want.',
          ),
        ],
      ),
    );
  }
}
