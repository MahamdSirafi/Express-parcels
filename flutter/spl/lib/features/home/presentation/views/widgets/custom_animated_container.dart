import 'package:flutter/material.dart';
import 'package:spl/core/utils/constants/duration_variables_constant.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';

class CustomAnimatedContainer extends StatelessWidget {
  const CustomAnimatedContainer({
    super.key,
    required this.isSelected,
    required this.child,
  });
  final bool isSelected;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return AnimatedContainer(
      //AnimatedContainer like Container, but in AnimatedContainer enable you to transport from old value to new value with time period, this will happen but if the the padding, margin, width, color,... attributes is changes in value them(so when you click on another icon in BottomNavigationBar so will change in value some attributes in AnimatedContainer so now the AnimatedContainer will work)
      duration: k750MilliSeconds,
      padding:
          isSelected
              ? EdgeInsets.symmetric(
                horizontal: size.width * 0.03,
                vertical: size.height * 0.01,
              )
              : EdgeInsets.zero,
      decoration:
          isSelected
              ? BoxDecoration(
                borderRadius: BorderRadius.circular(size.height * 0.033),
                color: StyleToColors.deepBlueColor,
              )
              : null,
      child: child,
    );
  }
}
