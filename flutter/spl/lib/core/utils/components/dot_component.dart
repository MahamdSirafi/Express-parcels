import 'package:flutter/material.dart';

class DotComponent extends StatelessWidget {
  const DotComponent({super.key, required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      height: size.height * 0.017,
      width: size.width * 0.017,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}
