import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/helpers/show_dialog_rate_shipment_helper.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';

class CustomTextButtonMyShipment extends StatefulWidget {
  const CustomTextButtonMyShipment({super.key});

  @override
  State<CustomTextButtonMyShipment> createState() =>
      _CustomTextButtonMyShipmentState();
}

class _CustomTextButtonMyShipmentState
    extends State<CustomTextButtonMyShipment> {
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
    return SizedBox(
      height: size.height * 0.038,
      width: size.width * 0.19,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: StyleToColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(size.height * 0.02),
            side: BorderSide(color: StyleToColors.mediumRedColor),
          ),
        ),
        onPressed: () => showDialogRateShipmentHelper(context: context),
        child: Text(
          isSelected == true ? 'معدل' : 'Rate',
          style: StyleToTexts.textStyleBold10(
            context: context,
          ).copyWith(color: StyleToColors.mediumRedColor),
        ),
      ),
    );
  }
}
