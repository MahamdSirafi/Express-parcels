import 'package:flutter/material.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_width.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomWonderImageAndTextServiceCenter extends StatelessWidget {
  const CustomWonderImageAndTextServiceCenter({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.only(left: width * 0.025),
      child: Row(
        children: [
          Assets.images.wonderSignImage.image(),
          SizedBoxWidth.width10(context: context),
          Text(text, style: StyleToTexts.textStyleNormal6(context: context)),
        ],
      ),
    );
  }
}
