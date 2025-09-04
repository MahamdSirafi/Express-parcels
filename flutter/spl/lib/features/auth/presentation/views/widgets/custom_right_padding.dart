import 'package:flutter/material.dart';

class CustomRightPadding extends StatelessWidget {
  const CustomRightPadding({
    super.key,
    required this.rightPercent,
    required this.child,
  });
  final double rightPercent;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.only(right: width * rightPercent),
      child: child,
    );
  }
}
