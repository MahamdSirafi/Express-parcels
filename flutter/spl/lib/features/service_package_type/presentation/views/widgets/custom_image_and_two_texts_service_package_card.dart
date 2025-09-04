import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/text_normal_8_component.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_width.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomImageAndTwoTextsServicePackageCard extends StatelessWidget {
  const CustomImageAndTwoTextsServicePackageCard({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Assets.images.wonderSignImage.image(),
        SizedBoxWidth.width15(context: context),
        Expanded(
          child: TextNormal8Component(
            text: text,
            maxLines: 2,
            textOverflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
