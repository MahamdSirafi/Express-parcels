import 'package:flutter/material.dart';
import 'package:spl/core/utils/helpers/outline_input_border_text_field_rate_shipment_dialog_helper.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';

class CustomTextFieldRateShipmentDialog extends StatelessWidget {
  const CustomTextFieldRateShipmentDialog({
    super.key,
    required this.textEditingController,
  });
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.only(right: width * 0.065, left: width * 0.11),
      child: TextField(
        controller: textEditingController,
        maxLines: 2,
        textInputAction: TextInputAction.done,
        //replace in keyboard the next lines button in check button
        style: StyleToTexts.textStyleNormal15(context: context),
        decoration: InputDecoration(
          enabledBorder: outlineInputBorderTextFieldRateShipmentDialogHelper(
            context: context,
          ),
          focusedBorder: outlineInputBorderTextFieldRateShipmentDialogHelper(
            context: context,
          ),
        ),
      ),
    );
  }
}
