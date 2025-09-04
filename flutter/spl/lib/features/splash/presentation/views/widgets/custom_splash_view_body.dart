import 'package:flutter/material.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/features/splash/presentation/views/widgets/custom_auth_buttons_and_divider_section.dart';
import 'package:spl/features/splash/presentation/views/widgets/custom_images_and_texts_section.dart';

class CustomSplashViewBody extends StatelessWidget {
  const CustomSplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomImagesAndTextsSection(),
        SizedBoxHeight.heightExpanded,
        CustomAuthButtonsAndDividerSection(),
      ],
    );
  }
}
