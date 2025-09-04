import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/cross_fade_card_component.dart';
import 'package:spl/core/utils/components/text_and_drop_icon_component.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';

class ContainCardAndCrossFadeCardSectionComponent extends StatelessWidget {
  const ContainCardAndCrossFadeCardSectionComponent({
    super.key,
    required this.colorToCard,
    required this.percentToBorderRadius,
    required this.textsInCrossFadeCard,
    required this.isExpandOrCollapse,
    required this.expandOrCollapseMethod,
    required this.textTitleInListTile,
  });
  final Color colorToCard;
  final double percentToBorderRadius;
  final List<String> textsInCrossFadeCard;
  final String textTitleInListTile;
  final bool isExpandOrCollapse;
  final VoidCallback expandOrCollapseMethod;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextAndDropIconComponent(
          colorToCard: colorToCard,
          percentToBorderRadius: percentToBorderRadius,
          isExpandOrCollapse: isExpandOrCollapse,
          expandOrCollapseMethod: expandOrCollapseMethod,
          text: textTitleInListTile,
        ),
        SizedBoxHeight.height10(context: context),
        CrossFadeCardComponent(
          isExpandOrCollapse: isExpandOrCollapse,
          textsInCrossFadeCard: textsInCrossFadeCard,
        ),
      ],
    );
  }
}
