import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spl/core/utils/components/text_bold_14_component.dart';
import 'package:spl/core/utils/lists/content_bottom_navigation_bar_list.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';

class CustomActiveContainerInBottomNavigationBar extends StatelessWidget {
  const CustomActiveContainerInBottomNavigationBar({
    super.key,
    required this.index,
    required this.isSelected,
  });
  final int index;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Row(
      children: [
        SvgPicture.asset(
          contentBottomNavigationBarList[index]['image']!,
          colorFilter: ColorFilter.mode(
            isSelected ? StyleToColors.whiteColor : StyleToColors.blackColor,
            BlendMode.srcIn,
          ),
        ),
        if (isSelected) ...[
          //(. one dot) it's name(Single dot): Access a property or method.
          //(.. two dots) it's name(Cascade operator): run many things in order on the same object
          //(... three dots) it's name(Spread operator): you insert list into another list(you insert this List in Row List(children))
          SizedBox(width: width * 0.015),
          TextBold14Component(
            text: contentBottomNavigationBarList[index]['label']!,
            color: StyleToColors.whiteColor,
          ),
        ],
      ],
    );
  }
}
