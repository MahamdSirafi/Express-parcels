import 'package:flutter/material.dart';
import 'package:spl/core/utils/lists/all_values_timeline_tile_list.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_width.dart';
import 'package:spl/features/track/presentation/views/widgets/custom_timeline_tile.dart';

class CustomTimelineTileAndTextInBelowIt extends StatelessWidget {
  const CustomTimelineTileAndTextInBelowIt({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBoxHeight.height72(
      context: context,
      //i need to tell to Timeline Tile your height will be just this available space from SizedBox
      child: Row(
        //i used Row instead of ListView.builder(horizontal) because numbers of Timeline Style isn't big, and sure i need to thing there is in it like loop because i have many things
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(steps.length, (index) {
          return SizedBoxWidth.width60(
            context: context,
            //determine length(width) the line that get out and get in from dot
            child: CustomTimelineTile(index: index),
          );
        }),
      ),
    );
  }
}
