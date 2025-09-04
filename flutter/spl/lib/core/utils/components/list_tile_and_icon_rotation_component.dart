import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/text_normal_16_component.dart';
import 'package:spl/core/utils/constants/duration_variables_constant.dart';

class ListTileAndIconRotationComponent extends StatelessWidget {
  const ListTileAndIconRotationComponent({
    super.key,
    required this.isExpandOrCollapse,
    required this.expandOrCollapseMethod,
    required this.text,
  });
  final bool isExpandOrCollapse;
  final VoidCallback expandOrCollapseMethod;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextNormal16Component(text: text),
      trailing: AnimatedRotation(
        //AnimatedRotation enable the icon to rotate
        duration: k200MilliSeconds, //duration for rotate
        turns: isExpandOrCollapse ? 0.5 : 0,
        //when the isExpandOrCollapse is true so i want to make the icon rotate to top(0.5), and if isExpandOrCollapse is false so return or stay the icon like on it(0)
        child: IconButton(
          onPressed: () => expandOrCollapseMethod(),
          icon: const Icon(Icons.keyboard_arrow_down),
        ),
      ),
    );
  }
}
