import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/text_button_with_just_text.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_width.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';

class CustomBodyDrawer extends StatelessWidget {
  const CustomBodyDrawer({
    super.key,
    required this.text,
    required this.image,
    required this.onPressed,
    this.rightWidget,
    this.isNeedToRightWidget = false,
  });
  final String text, image;
  final Widget? rightWidget;
  final bool? isNeedToRightWidget;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.only(left: width * 0.055, right: width * 0.045),
      child: Row(
        children: [
          Image.asset(image),
          SizedBoxWidth.width15(context: context),
          TextButtonWithJustText(
            text: text,
            onPressed: onPressed,
            style: StyleToTexts.textStyleNormal14(
              context: context,
            ).copyWith(color: StyleToColors.blackColor),
          ),
          SizedBoxWidth.widthExpanded,
          isNeedToRightWidget == false
              ? Transform.rotate(
                angle: -3.14159265,
                child: const Icon(Icons.arrow_back_ios),
              )
              : rightWidget!,
        ],
      ),
    );
  }
}
