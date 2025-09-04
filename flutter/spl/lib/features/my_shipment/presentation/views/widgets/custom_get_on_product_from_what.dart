import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/text_normal_10_component.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomGetOnProductFromWhat extends StatelessWidget {
  const CustomGetOnProductFromWhat({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Transform.translate(
          offset: Offset(-size.width * 0.085, size.height * 0.02),
          child: const TextNormal10Component(text: 'by Truck'),
        ),
        Assets.images.truckShipmentImage.image(height: size.height * 0.08),
      ],
    );
  }
}
