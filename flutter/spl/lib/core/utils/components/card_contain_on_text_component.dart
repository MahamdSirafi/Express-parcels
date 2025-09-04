import 'package:flutter/material.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';

class CardContainOnTextComponent extends StatelessWidget {
  const CardContainOnTextComponent({
    super.key,
    this.text,
    required this.onTap,
    this.color,
    this.side,
    this.isNeedToWidget,
    this.widget,
  });
  final String? text;
  final Color? color, side;
  final VoidCallback onTap;
  final bool? isNeedToWidget;
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SizedBoxHeight.height62(
      context: context,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isNeedToWidget == true ? 0 : size.width * 0.035,
        ),
        child: GestureDetector(
          onTap: onTap,
          child: Card(
            elevation: 10,
            color: color ?? StyleToColors.deepBlueColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(size.height * 0.03),
              side: BorderSide(color: side ?? StyleToColors.transparentColor),
            ),
            child: Center(
              child:
                  isNeedToWidget == true
                      ? widget
                      : Text(
                        text!,
                        style: StyleToTexts.textStyleMedium22(context: context),
                      ),
            ),
          ),
        ),
      ),
    );
  }
}
