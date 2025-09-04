import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/text_normal_8_component.dart';
import 'package:spl/core/utils/lists/all_values_timeline_tile_list.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:timeline_tile/timeline_tile.dart';

class CustomTimelineTile extends StatelessWidget {
  const CustomTimelineTile({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    //assign condition to three parameters
    final step = steps[index]; //make the code more clean
    final bool isFirst = index == 0;
    //isFirst take true on first dot in Timeline Tile just
    final bool isLast = index == steps.length - 1;
    //isLast take true on last dot in Timeline Tile just
    final bool nextCompleted =
        index < steps.length - 1 && steps[index + 1].isCompleted;
    //nextCompleted to control on color the afterLineStyle and you can't benefit from use isCompleted like in beforeLineStyle(you can try)
    //explain the condition in nextCompleted: 1: index < steps.length - 1(if index smaller than 4(not 5 focus because in last dot sure there is no afterLineStyle), 2: steps[index + 1].isCompleted(in next line(index + 1) the isCompleted attribute give me value it in this next line))
    return TimelineTile(
      //this TimelineTile widget from package
      axis: TimelineAxis.horizontal,
      //i want shape the Timeline Tile is horizontal, you can see the package because there are many shapes
      isFirst: isFirst,
      //you need to say this dot is first dot(to make the Timeline Tile know and will don't put before line(there is no line get in from first dot))
      isLast: isLast,
      //you need to say this dot is last dot(to make the Timeline Tile know and will don't put after line(there is no line get out from last dot))
      beforeLineStyle: LineStyle(
        //look there two lines and two lines connect with dot(1: line get in(from left) from dot and this line control on style it this attribute(beforeLineStyle))
        color:
            step.isCompleted
                ? StyleToColors.skyBlueColor
                : StyleToColors.greyShade300Coolor,
        thickness: 2,
      ),
      afterLineStyle: LineStyle(
        //look there two lines and two lines connect with dot(2: line get out(from right) from dot and this line control on style it this attribute(afterLineStyle))
        color:
            nextCompleted
                ? StyleToColors.skyBlueColor
                : StyleToColors.greyShade300Coolor,
        thickness: 2,
      ),
      indicatorStyle: IndicatorStyle(
        //style to dot
        width: size.width * 0.035,
        height: size.height * 0.035,
        indicator: Container(
          //indicator attribute(this attribute enable you to build the dot)
          decoration: BoxDecoration(
            color:
                step.isCompleted
                    ? StyleToColors.skyBlueColor
                    : StyleToColors.whiteColor,
            border: Border.all(
              color:
                  step.isCompleted
                      ? StyleToColors.transparentColor
                      : StyleToColors.greyColor,
            ),
            shape: BoxShape.circle,
          ),
        ),
      ),
      endChild: Padding(
        //endChild attribute(will put the text in below the dot)
        padding: EdgeInsets.only(top: size.height * 0.013),
        child: TextNormal8Component(
          text: step.label,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
