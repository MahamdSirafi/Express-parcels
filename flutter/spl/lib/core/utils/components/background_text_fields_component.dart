import 'package:flutter/material.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';

class BackgroundTextFieldsComponent extends StatelessWidget {
  const BackgroundTextFieldsComponent({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      padding: EdgeInsets.only(top: size.height * 0.017),
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.035),
      decoration: BoxDecoration(
        color: StyleToColors.littleWhiteColor.withAlpha(50),
        borderRadius: BorderRadius.circular(size.height * 0.03),
      ),
      child: child,
    );
  }
}
