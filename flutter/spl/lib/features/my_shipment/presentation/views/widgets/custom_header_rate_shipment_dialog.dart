import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/components/custom_text_bold_26.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/components/text_bold_14_component.dart';

class CustomHeaderRateShipmentDialog extends StatefulWidget {
  const CustomHeaderRateShipmentDialog({super.key});

  @override
  State<CustomHeaderRateShipmentDialog> createState() =>
      _CustomHeaderRateShipmentDialogState();
}

class _CustomHeaderRateShipmentDialogState
    extends State<CustomHeaderRateShipmentDialog> {
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
        Align(
          alignment: Alignment.center,
          child: TextBold26Component(
            text: isSelected == true ? 'قيمنا' : 'Rate Us',
            color: StyleToColors.deepBlueColor,
            textDecoration: TextDecoration.underline,
            decorationColor: StyleToColors.deepBlueColor,
          ),
        ),
        TextBold14Component(
          text: isSelected == true ? 'قم بتقييم شحنتك' : 'Rate your shipment',
          percent: 0.07,
        ),
      ],
    );
  }
}
