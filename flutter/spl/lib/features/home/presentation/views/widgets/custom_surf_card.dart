import 'package:flutter/material.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/features/home/presentation/views/widgets/custom_contain_surf_card.dart';

class CustomSurfCard extends StatelessWidget {
  const CustomSurfCard({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      margin: EdgeInsets.only(right: size.width * 0.012),
      padding: EdgeInsets.only(
        right: size.width * 0.012,
        left: size.width * 0.035,
      ),
      height: size.height * 0.033,
      width: double.infinity,
      decoration: BoxDecoration(
        color: StyleToColors.whiteColor,
        borderRadius: BorderRadius.circular(size.height * 0.025),
      ),
      child: const CustomContainSurfCard(),
    );
  }
}
