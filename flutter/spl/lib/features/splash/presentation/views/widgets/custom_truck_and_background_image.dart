import 'package:flutter/material.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomTruckAndBackgroundImage extends StatelessWidget {
  const CustomTruckAndBackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Stack(
      children: [
        Assets.images.truckBackgroundImage.image(),
        Positioned(
          left: size.width * 0.035,
          bottom: size.height * 0.018,
          child: Assets.images.truckMobileRoadImage.image(),
        ),
      ],
    );
  }
}
