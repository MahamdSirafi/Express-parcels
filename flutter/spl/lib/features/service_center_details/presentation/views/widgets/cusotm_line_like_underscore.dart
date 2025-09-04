import 'package:flutter/material.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';

class CusotmLineLikeUnderscore extends StatelessWidget {
  const CusotmLineLikeUnderscore({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      height: size.height * 0.002,
      width: size.width * 0.012,
      color: StyleToColors.blackColor,
    );
  }
}
