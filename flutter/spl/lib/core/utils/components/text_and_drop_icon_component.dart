import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/list_tile_and_icon_rotation_component.dart';

class TextAndDropIconComponent extends StatelessWidget {
  const TextAndDropIconComponent({
    super.key,
    required this.isExpandOrCollapse,
    required this.expandOrCollapseMethod,
    required this.text,
    required this.colorToCard,
    required this.percentToBorderRadius,
  });
  final bool isExpandOrCollapse;
  final VoidCallback expandOrCollapseMethod;
  final Color colorToCard;
  final double percentToBorderRadius;
  final String text;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.07),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          size.height * percentToBorderRadius,
        ),
      ),
      color: colorToCard,
      child: ListTileAndIconRotationComponent(
        isExpandOrCollapse: isExpandOrCollapse,
        expandOrCollapseMethod: expandOrCollapseMethod,
        text: text,
      ),
    );
  }
}
