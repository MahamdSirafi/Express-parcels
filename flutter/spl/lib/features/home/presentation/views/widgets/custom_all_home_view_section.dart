import 'package:flutter/material.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/features/home/presentation/views/widgets/custom_home_bottom_section.dart';
import 'package:spl/features/home/presentation/views/widgets/custom_home_middle_section.dart';
import 'package:spl/features/home/presentation/views/widgets/custom_home_top_section.dart';

class CustomAllHomeViewSection extends StatelessWidget {
  const CustomAllHomeViewSection({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBoxHeight.height23(context: context),
        CustomHomeTopSection(scaffoldKey: scaffoldKey),
        const CustomHomeMiddleSection(),
        SizedBoxHeight.height30(context: context),
        const CustomHomeBottomSection(),
      ],
    );
  }
}
