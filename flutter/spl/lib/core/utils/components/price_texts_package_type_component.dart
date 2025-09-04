import 'package:flutter/material.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';

class PriceTextsPackageTypeComponent extends StatelessWidget {
  const PriceTextsPackageTypeComponent({super.key, required this.price});
  final int price;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Price: ',
          style: StyleToTexts.textStyleNormal12(context: context),
        ),
        Text(
          '$price SYP',
          style: StyleToTexts.textStyleBold12(
            context: context,
          ).copyWith(color: StyleToColors.littleNeonGreenColor),
        ),
      ],
    );
  }
}
