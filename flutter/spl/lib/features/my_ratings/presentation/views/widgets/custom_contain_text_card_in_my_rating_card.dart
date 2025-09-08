import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/components/text_normal_8_component.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';

class CustomContainTextCardInMyRatingCard extends StatefulWidget {
  const CustomContainTextCardInMyRatingCard({super.key});

  @override
  State<CustomContainTextCardInMyRatingCard> createState() =>
      _CustomContainTextCardInMyRatingCardState();
}

class _CustomContainTextCardInMyRatingCardState
    extends State<CustomContainTextCardInMyRatingCard> {
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextNormal8Component(
          text:
              isSelected == true
                  ? 'وصلت الحزمة في حالة جيدة، وكان التواصل واضحا.'
                  : 'The package arrived in good condition, and communication 0was clear.',
        ),
        TextNormal8Component(
          text: isSelected == true ? '0كان واضحا.' : '0was clear.',
        ),
      ],
    );
  }
}
