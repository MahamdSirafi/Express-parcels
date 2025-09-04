import 'package:flutter/material.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/helpers/push_go_router_helper.dart';
import 'package:spl/features/home/presentation/views/widgets/custom_image_text_button_section.dart';
import 'package:spl/features/home/presentation/views/widgets/custom_many_of_service_center_cards.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomHomeMiddleSection extends StatelessWidget {
  const CustomHomeMiddleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomImageTextButtonSection(
          image: Assets.images.locationBlackImageP.image(),
          text: 'Services Centers',
          onPressed:
              () => pushGoRouterHelper(
                context: context,
                view: kServiceCenterViewRouter,
              ),
        ),
        const CustomManyOfServiceCenterCards(),
      ],
    );
  }
}
