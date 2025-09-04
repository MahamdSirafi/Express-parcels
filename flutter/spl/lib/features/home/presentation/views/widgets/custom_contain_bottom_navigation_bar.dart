import 'package:flutter/material.dart';
import 'package:spl/core/utils/lists/content_bottom_navigation_bar_list.dart';
import 'package:spl/features/home/presentation/views/widgets/custom_active_container_in_bottom_navigation_bar.dart';
import 'package:spl/features/home/presentation/views/widgets/custom_animated_container.dart';

class CustomContainBottomNavigationBar extends StatelessWidget {
  const CustomContainBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });
  final int currentIndex;
  final ValueChanged<int> onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(contentBottomNavigationBarList.length, (index) {
        final isSelected = index == currentIndex;
        //give true or false value(from condition) to isSelected, 1: index(position the icon in BottomNavigationBar), currentIndex(position the icon in BottomNavigationBar i clicked on it), 2: i need to value isSelected because when i click on icon in BottomNavigationBar so will happen many things.
        return GestureDetector(
          onTap: () => onTap(index),
          child: CustomAnimatedContainer(
            isSelected: isSelected,
            child: CustomActiveContainerInBottomNavigationBar(
              index: index,
              isSelected: isSelected,
            ),
          ),
        );
      }),
    );
  }
}
