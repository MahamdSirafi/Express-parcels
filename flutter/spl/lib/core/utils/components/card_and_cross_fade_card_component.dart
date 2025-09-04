import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/contain_card_and_cross_fade_card_section_component.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';

class CardAndCrossFadeCardComponent extends StatefulWidget {
  const CardAndCrossFadeCardComponent({
    super.key,
    required this.colorToCard,
    required this.percentToBorderRadius,
    required this.textsInCrossFadeFirstCard,
    required this.textsInCrossFadeSecondCard,
    required this.textsInCrossFadeThirdCard,
    required this.titleTextsInListTile,
  });
  final Color colorToCard;
  final double percentToBorderRadius;
  final List<String> textsInCrossFadeFirstCard,
      textsInCrossFadeSecondCard,
      textsInCrossFadeThirdCard,
      titleTextsInListTile;

  @override
  State<CardAndCrossFadeCardComponent> createState() =>
      _CardAndCrossFadeCardComponentState();
}

class _CardAndCrossFadeCardComponentState
    extends State<CardAndCrossFadeCardComponent> {
  late List<bool> isExpandOrCollapse;
  //this variables to enable the user to expand or collapse the Containers, sure i need to multi values because i have three Cards and if i want to make two Cards is active(click on icon) and one is unactive
  @override
  void initState() {
    super.initState();
    isExpandOrCollapse = List.filled(widget.titleTextsInListTile.length, false);
    //create empty list and fill it in false value and number of elements it's length this list(titleTextsInListTileList)
  }

  void expandOrCollapseMethod({required int index}) {
    setState(() {
      isExpandOrCollapse[index] = !isExpandOrCollapse[index];
    });
  } //this method to change values the elements when i click on icons

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(widget.titleTextsInListTile.length, (index) {
        return Column(
          children: [
            ContainCardAndCrossFadeCardSectionComponent(
              colorToCard: widget.colorToCard,
              percentToBorderRadius: widget.percentToBorderRadius,
              textsInCrossFadeCard:
                  index == 0
                      ? widget.textsInCrossFadeFirstCard
                      : index == 1
                      ? widget.textsInCrossFadeSecondCard
                      : widget.textsInCrossFadeThirdCard,
              isExpandOrCollapse: isExpandOrCollapse[index],
              expandOrCollapseMethod:
                  () => expandOrCollapseMethod(index: index),
              textTitleInListTile: widget.titleTextsInListTile[index],
            ),
            if (index != widget.titleTextsInListTile.length - 1)
              //this condition to ensure doesn't build the last height SizedBox
              SizedBoxHeight.height29(context: context),
          ],
        );
      }),
    );
  }
}
