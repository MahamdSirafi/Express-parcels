import 'package:flutter/material.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/features/home/presentation/views/widgets/custom_contain_bottom_navigation_bar.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });
  final int currentIndex;
  final ValueChanged<int> onTap; // it's same void Function(int)? onTap
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.04,
        vertical: size.height * 0.015,
      ),
      margin: EdgeInsets.all(size.height * 0.021),
      decoration: BoxDecoration(
        color: StyleToColors.whiteColor,
        borderRadius: BorderRadius.circular(size.height * 0.044),
        border: Border.all(color: StyleToColors.deepBlueColor),
        boxShadow: [
          BoxShadow(
            color: StyleToColors.blackColor.withAlpha(100),
            blurRadius: 10,
            offset: Offset(0, size.height * 0.01),
          ),
        ],
      ),
      child: CustomContainBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
      ),
    );
  }
}
