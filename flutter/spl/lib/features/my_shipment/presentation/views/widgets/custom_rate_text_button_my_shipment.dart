import 'package:flutter/material.dart';
import 'package:spl/core/utils/helpers/show_dialog_rate_shipment_helper.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';

class CustomTextButtonMyShipment extends StatelessWidget {
  const CustomTextButtonMyShipment({super.key});
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
          'Rate',
          style: StyleToTexts.textStyleBold10(
            context: context,
          ).copyWith(color: StyleToColors.mediumRedColor),
        ),
      ),
    );
  }
}
