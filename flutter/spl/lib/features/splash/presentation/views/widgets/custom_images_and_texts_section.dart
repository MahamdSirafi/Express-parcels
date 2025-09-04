import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/text_bold_20_component.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/features/splash/presentation/views/widgets/custom_truck_and_background_image.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomImagesAndTextsSection extends StatelessWidget {
  const CustomImagesAndTextsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomTruckAndBackgroundImage(),
          const TextBold20Component(
            text: 'Welcome to',
            color: StyleToColors.greyColor,
          ),
          Assets.images.expressSyriaImage.image(
            height: 150,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          const TextBold20Component(
            text: 'track your shipment step by step',
            color: StyleToColors.greyColor,
          ),
        ],
      ),
    );
  }
}
