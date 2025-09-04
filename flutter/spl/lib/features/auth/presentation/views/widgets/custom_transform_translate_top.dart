import 'package:flutter/material.dart';

class CustomTransformTranslateTop extends StatelessWidget {
  const CustomTransformTranslateTop({
    super.key,
    required this.topPercent,
    required this.child,
  });
  final double topPercent;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Transform.translate(
      offset: Offset(0, -height * topPercent),
      child: child,
    );
  }
}
