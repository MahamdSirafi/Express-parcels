import 'package:flutter/material.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/helpers/push_go_router_helper.dart';
import 'package:spl/features/home/presentation/views/widgets/custom_generate_parcel_type.dart';
import 'package:spl/features/home/presentation/views/widgets/custom_image_text_button_section.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomHomeBottomSection extends StatelessWidget {
  const CustomHomeBottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomImageTextButtonSection(
          image: Assets.images.quickOrderImage.image(),
          text: 'Parcel Type',
          onPressed:
              () => pushGoRouterHelper(
                context: context,
                view: kPackagesTypeViewRouter,
              ),
        ),
        const CustomGenerateParcelType(),
      ],
    );
  }
}
