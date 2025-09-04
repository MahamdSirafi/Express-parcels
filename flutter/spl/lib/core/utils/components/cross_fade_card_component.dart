import 'package:flutter/material.dart';
import 'package:spl/core/utils/constants/duration_variables_constant.dart';
import 'package:spl/core/utils/components/first_child_component.dart';

class CrossFadeCardComponent extends StatelessWidget {
  const CrossFadeCardComponent({
    super.key,
    required this.isExpandOrCollapse,
    required this.textsInCrossFadeCard,
  });
  final bool isExpandOrCollapse;
  final List<String> textsInCrossFadeCard;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      //AnimatedCrossFade to make the Container appear and disappear
      firstChild: FirstChildComponent(
        textsInCrossFadeCard: textsInCrossFadeCard,
      ),
      //firstChild attribute take widget i want it to appear
      secondChild: const SizedBox.shrink(),
      //secondChild attribute take widget i want it to disappear
      crossFadeState:
          isExpandOrCollapse
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
      //crossFadeState attribute to make the widget in firstChild attribute appear when the isExpandOrCollapse is true(CrossFadeState.showFirst), and if isExpandOrCollapse is false(CrossFadeState.showSecond)
      duration: k300MilliSeconds,
    );
  }
}
