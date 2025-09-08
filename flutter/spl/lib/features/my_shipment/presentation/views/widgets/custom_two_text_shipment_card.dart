import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/components/text_normal_8_component.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_width.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/components/text_normal_10_component.dart';

class CustomTwoTextShipmentCard extends StatefulWidget {
  const CustomTwoTextShipmentCard({super.key});

  @override
  State<CustomTwoTextShipmentCard> createState() =>
      _CustomTwoTextShipmentCardState();
}

class _CustomTwoTextShipmentCardState extends State<CustomTwoTextShipmentCard> {
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
    return Row(
      children: [
        TextNormal10Component(
          text: isSelected == true ? 'عدد تتبع' : 'Tracking number',
        ),
        SizedBoxWidth.width4(context: context),
        const TextNormal8Component(
          text: '#SY123456',
          textColor: StyleToColors.littleGreyLevel2Color,
        ),
      ],
    );
  }
}
