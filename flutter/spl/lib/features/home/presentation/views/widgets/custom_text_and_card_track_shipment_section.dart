import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/components/custom_text_bold_26.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';

class CustomTextAndCardTrackShipmentSection extends StatefulWidget {
  const CustomTextAndCardTrackShipmentSection({super.key});

  @override
  State<CustomTextAndCardTrackShipmentSection> createState() =>
      _CustomTextAndCardTrackShipmentSectionState();
}

class _CustomTextAndCardTrackShipmentSectionState
    extends State<CustomTextAndCardTrackShipmentSection> {
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
    return Padding(
      padding: EdgeInsets.only(
        left: size.width * 0.09,
        bottom: size.height * 0.01,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: TextBold26Component(text: isSelected == true ? 'بيت' : 'Home'),
      ),
    );
  }
}
