import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/text_normal_10_component.dart';

class AllTextsCrossFadeCardComponent extends StatelessWidget {
  const AllTextsCrossFadeCardComponent({
    super.key,
    required this.textsInCrossFadeCard,
  });
  final List<String> textsInCrossFadeCard;
  @override
  Widget build(BuildContext context) {
    return TextNormal10Component(
      text:
          textsInCrossFadeCard[0] +
          textsInCrossFadeCard[1] +
          textsInCrossFadeCard[2] +
          textsInCrossFadeCard[3] +
          textsInCrossFadeCard[4],
    ); //element + element.., like '' '' ..,
  }
}
