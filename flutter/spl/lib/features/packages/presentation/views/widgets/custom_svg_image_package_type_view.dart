import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomSvgImagePackageTypeView extends StatelessWidget {
  const CustomSvgImagePackageTypeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      Assets.images.dateImage.path,
      colorFilter: const ColorFilter.mode(
        StyleToColors.deepBlueColor,
        BlendMode.srcIn,
      ),
    );
  }
}
