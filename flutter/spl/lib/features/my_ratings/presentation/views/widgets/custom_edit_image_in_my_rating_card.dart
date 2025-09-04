import 'package:flutter/material.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/helpers/push_go_router_helper.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomEditImageInMyRatingCard extends StatelessWidget {
  const CustomEditImageInMyRatingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () =>
              pushGoRouterHelper(context: context, view: kMyShipmentViewRouter),
      child: Assets.images.editButtonImage.image(),
    );
  }
}
