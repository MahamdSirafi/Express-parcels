import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/components/custom_text_bold_26.dart';
import 'package:spl/core/utils/components/left_padding_component.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';

class CustomParcelTextMyShipment extends StatefulWidget {
  const CustomParcelTextMyShipment({super.key});

  @override
  State<CustomParcelTextMyShipment> createState() =>
      _CustomParcelTextMyShipmentState();
}

class _CustomParcelTextMyShipmentState
    extends State<CustomParcelTextMyShipment> {
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
      leftPercent: 0.08,
      child: Align(
        alignment: Alignment.centerLeft,
        child: TextBold26Component(
          text: isSelected == true ? 'طرودى' : 'My Parcels',
        ),
      ),
    );
  }
}
