import 'package:flutter/material.dart';
import 'package:spl/core/utils/helpers/pop_go_router_helper.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/generator/assets.gen.dart';

class BackArrowImageComponent extends StatelessWidget {
  const BackArrowImageComponent({super.key, this.imageColor});
  final Color? imageColor;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return GestureDetector(
      onTap: () => popGoRouterHelper(context: context),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Assets.images.backArrowImage.svg(
          height: height * 0.033,
          colorFilter: ColorFilter.mode(
            imageColor ?? StyleToColors.blackColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
