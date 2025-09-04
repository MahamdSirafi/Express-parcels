import 'package:flutter/material.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/features/home/presentation/views/widgets/custom_header_in_show_dialog_log_out.dart';
import 'package:spl/features/home/presentation/views/widgets/custom_two_text_button_in_show_dialog_log_out.dart';

class CustomContainShowDialogLogOut extends StatelessWidget {
  const CustomContainShowDialogLogOut({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.only(
        top: size.height * 0.02,
        right: size.width * 0.047,
        left: size.width * 0.06,
        bottom: size.height * 0.035,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        //to make the Column take height equal to elements it, not full view
        children: [
          const CustomHeaderInShowDialogLogOut(),
          SizedBoxHeight.height33(context: context),
          const CustomTwoTextButtonInShowDialogLogOut(),
          SizedBoxHeight.height10(context: context),
        ],
      ),
    );
  }
}
