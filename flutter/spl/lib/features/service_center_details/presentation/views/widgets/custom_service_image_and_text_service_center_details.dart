import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/text_bold_12_component.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_width.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomServiceImageAndTextServiceCenterDetails extends StatelessWidget {
  const CustomServiceImageAndTextServiceCenterDetails({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.only(left: width * 0.074),
      child: Row(
        children: [
          Assets.images.threeSettingsImage.image(),
          SizedBoxWidth.width10(context: context),
          TextBold12Component(
            text: 'Services Offered',
            color: StyleToColors.deepBlueColor,
          ),
        ],
      ),
    );
  }
}
