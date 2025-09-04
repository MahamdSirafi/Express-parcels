import 'package:flutter/material.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';

class CustomBackgroundShipmentCard extends StatelessWidget {
  const CustomBackgroundShipmentCard({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: size.width * 0.035,
        vertical: size.height * 0.015,
      ),
      padding: EdgeInsets.only(
        right: size.width * 0.037,
        left: size.width * 0.037,
        top: size.height * 0.01,
        bottom: size.height * 0.01,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.height * 0.033),
        color: StyleToColors.greyColor.withAlpha(25),
      ),
      child: child,
    );
  }
}
