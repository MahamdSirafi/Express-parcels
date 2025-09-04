import 'package:flutter/material.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomRightSideContainPackageType extends StatelessWidget {
  const CustomRightSideContainPackageType({super.key});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return ClipRRect(
      borderRadius: BorderRadius.circular(height * 0.021),
      child: SizedBox(
        height: height * 0.17,
        child: Assets.images.parcelTypePackageImage.image(),
      ),
    );
  }
}
