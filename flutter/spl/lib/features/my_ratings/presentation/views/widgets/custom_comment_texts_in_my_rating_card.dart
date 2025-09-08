import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/components/text_normal_16_component.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/components/text_normal_8_component.dart';

class CustomCommentTextsInMyRatingCard extends StatefulWidget {
  const CustomCommentTextsInMyRatingCard({super.key});

  @override
  State<CustomCommentTextsInMyRatingCard> createState() =>
      _CustomCommentTextsInMyRatingCardState();
}

class _CustomCommentTextsInMyRatingCardState
    extends State<CustomCommentTextsInMyRatingCard> {
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
        TextNormal16Component(text: isSelected == true ? 'تعليق:' : 'Comment:'),
        SizedBoxHeight.height10(context: context),
        TextNormal8Component(
          text:
              isSelected == true
                  ? 'تم إرسال هذه المراجعة بعد استلام الحزمة رقم SY.111.'
                  : 'This review was sent after receiving package #SY.111.',
          textColor: StyleToColors.mediumRedColor,
        ),
        TextNormal8Component(
          text:
              isSelected == true
                  ? 'تم تعديل هذه المراجعة آخر مرة بتاريخ 22/04/2025.'
                  : 'This review was last modified on 04/22/2025.',
          textColor: StyleToColors.mediumRedColor,
        ),
      ],
    );
  }
}
