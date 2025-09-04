import 'package:flutter/material.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/components/all_texts_cross_fade_card_component.dart';

class FirstChildComponent extends StatelessWidget {
  const FirstChildComponent({super.key, required this.textsInCrossFadeCard});
  final List<String> textsInCrossFadeCard;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.07),
      padding: EdgeInsets.only(
        top: size.height * 0.02,
        left: size.width * 0.06,
        right: size.width * 0.065,
        bottom: size.height * 0.033,
      ),
      decoration: BoxDecoration(
        color: StyleToColors.whiteColor,
        borderRadius: BorderRadius.circular(size.height * 0.028),
      ),
      child: AllTextsCrossFadeCardComponent(
        textsInCrossFadeCard: textsInCrossFadeCard,
      ),
    );
  }
}
