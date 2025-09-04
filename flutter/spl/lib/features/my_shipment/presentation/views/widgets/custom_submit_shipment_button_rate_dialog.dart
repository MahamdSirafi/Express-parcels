import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/text_bold_14_component.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';

class CustomSubmitShipmentButtonRateDialog extends StatelessWidget {
  const CustomSubmitShipmentButtonRateDialog({
    super.key,
    required this.onPressed,
  });
  final void Function()? onPressed;
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
            onPressed: onPressed,
            child: const TextBold14Component(
              text: 'Submit',
              color: StyleToColors.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
