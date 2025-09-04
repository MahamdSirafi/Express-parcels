import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/text_bold_16_component.dart';
import 'package:spl/core/utils/constants/duration_variables_constant.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';

void showSnackBarWithActionHelper({
  required BuildContext context,
  required String text,
  Color? color,
}) {
  final messenger = ScaffoldMessenger.of(context);
  double height = MediaQuery.sizeOf(context).height;
  messenger.clearSnackBars();
  //so when the snackBar will appear so it will appear normally but when the user try to appear another snackBars for example appeared SnackBar to user and after this SnackBar there are two SnackBars wait to appear but this .clearSnackBars() will delete all SnackBars that wait, so now you can appear new snackBar
  //this operation is very benefit because maybe the user cause many of problems so appear many of snackBar but sometimes the user solve the problem but after some duration will appear snackBar to solve this problem and the user solved it, so this happen because many of requests on SnackBars so you should use .clearSnackBars() to appear just newest SnackBars and delete all SnackBars that wait to appeared
  messenger.showSnackBar(
    SnackBar(
      duration: kSevenSeconds,
      backgroundColor: color ?? StyleToColors.redColor,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(height * 0.025),
      ),
      action: SnackBarAction(
        label: 'OK',
        textColor: StyleToColors.whiteColor,
        backgroundColor: StyleToColors.whiteColor.withAlpha(125),
        disabledBackgroundColor: StyleToColors.whiteColor.withAlpha(75),
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
      content: TextBold16Component(text: text, color: StyleToColors.whiteColor),
    ),
  );
}
