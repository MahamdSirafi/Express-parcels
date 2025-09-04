import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/text_bold_16_component.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_width.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomOpeningImageAndTextServiceCenterDetails extends StatelessWidget {
  const CustomOpeningImageAndTextServiceCenterDetails({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.037),
      child: Row(
        children: [
          Assets.images.blueWatchImage.image(),
          SizedBoxWidth.width15(context: context),
          const TextBold16Component(text: 'Operating Hours'),
        ],
      ),
    );
  }
}
