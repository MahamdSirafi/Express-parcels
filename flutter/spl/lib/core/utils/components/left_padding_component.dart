import 'package:flutter/material.dart';

class LeftPaddingComponent extends StatelessWidget {
  const LeftPaddingComponent({
    super.key,
    required this.leftPercent,
    required this.child,
  });
  final double leftPercent;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.only(left: width * leftPercent),
      child: child,
    );
  }
}
