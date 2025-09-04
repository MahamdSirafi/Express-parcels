import 'package:flutter/material.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';

class CustomGenerateFourCardsInsideServiceCenter extends StatelessWidget {
  const CustomGenerateFourCardsInsideServiceCenter({
    super.key,
    required this.serviceOffered,
  });
  final List<dynamic> serviceOffered;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Wrap(
      spacing: size.width * 0.037,
      runSpacing: size.height * 0.014,
      children: List.generate(serviceOffered.length, (index) {
        final texts = serviceOffered[index];
        return Container(
          height: size.height * 0.028,
          width: size.width * 0.168,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: StyleToColors.littleGreyLevel1Color,
            borderRadius: BorderRadius.circular(size.height * 0.007),
          ),
          child: Text(
            texts,
            style: StyleToTexts.textStyleNormal6(context: context),
          ),
        );
      }),
    );
  }
}
//delete list four items