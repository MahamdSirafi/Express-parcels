import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spl/core/utils/lists/all_values_timeline_tile_list.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';

class CustomAllImagesInUpTimelineTile extends StatelessWidget {
  const CustomAllImagesInUpTimelineTile({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.185),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(steps.length, (index) {
          final step = steps[index]; //to make my code more clean
          return SvgPicture.asset(
            step.image,
            colorFilter: ColorFilter.mode(
              step.isCompleted
                  ? StyleToColors.skyBlueColor
                  : StyleToColors.blackColor,
              BlendMode.srcIn,
            ),
          );
        }),
      ),
    );
  }
}
