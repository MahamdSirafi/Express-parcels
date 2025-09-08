import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/components/text_bold_14_component.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';

class CustomSubmitShipmentButtonRateDialog extends StatefulWidget {
  const CustomSubmitShipmentButtonRateDialog({
    super.key,
    required this.onPressed,
  });
  final void Function()? onPressed;

  @override
  State<CustomSubmitShipmentButtonRateDialog> createState() =>
      _CustomSubmitShipmentButtonRateDialogState();
}

class _CustomSubmitShipmentButtonRateDialogState
    extends State<CustomSubmitShipmentButtonRateDialog> {
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
    return Padding(
      padding: EdgeInsets.only(right: size.width * 0.065),
      child: Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
          height: size.height * 0.056,
          width: size.width * 0.23,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: StyleToColors.deepBlueColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(size.height * 0.03),
              ),
            ),
            onPressed: widget.onPressed,
            child: TextBold14Component(
              text: isSelected == true ? 'يُقدِّم' : 'Submit',
              color: StyleToColors.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
