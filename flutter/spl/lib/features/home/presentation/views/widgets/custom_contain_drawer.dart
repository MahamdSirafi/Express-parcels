import 'package:flutter/material.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/features/home/presentation/views/widgets/custom_all_body_drawer_section.dart';
import 'package:spl/features/home/presentation/views/widgets/custom_head_drawer.dart';
import 'package:spl/features/home/presentation/views/widgets/custom_last_drawer.dart';

class CustomContainDrawer extends StatelessWidget {
  const CustomContainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBoxHeight.height49(context: context),
        const CustomHeadDrawer(),
        SizedBoxHeight.height49(context: context),
        const CustomAllBodyDrawerSection(),
        SizedBoxHeight.heightExpanded,
        const CustomLastDrawer(),
        SizedBoxHeight.height40(context: context),
      ],
    );
  }
}
