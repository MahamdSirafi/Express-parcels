import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/left_padding_component.dart';
import 'package:spl/core/utils/components/text_button_with_just_text.dart';
import 'package:spl/core/utils/helpers/show_dialog_log_out_helper.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_width.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomLastDrawer extends StatelessWidget {
  const CustomLastDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return LeftPaddingComponent(
      leftPercent: 0.07,
      child: Row(
        children: [
          Assets.images.logOutImage.image(),
          SizedBoxWidth.width15(context: context),
          TextButtonWithJustText(
            text: 'Log Out',
            onPressed: () => showDialogLogOutHelper(context: context),
            style: StyleToTexts.textStyleBold16(
              context: context,
            ).copyWith(color: StyleToColors.blackColor),
          ),
        ],
      ),
    );
  }
}
