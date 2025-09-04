import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/left_padding_component.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/helpers/push_go_router_helper.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/features/home/presentation/views/widgets/custom_body_drawer.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomAllBodyDrawerSection extends StatelessWidget {
  const CustomAllBodyDrawerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomBodyDrawer(
          text: 'About Our App',
          onPressed: () {},
          image: Assets.images.aboutOurAppImage.path,
        ),
        SizedBoxHeight.height23(context: context),
        CustomBodyDrawer(
          text: 'Privacy Policy',
          onPressed: () {
            pushGoRouterHelper(
              context: context,
              view: kPrivacyAndPolicyViewRouter,
            );
          },
          image: Assets.images.privacyPolicyImage.path,
        ),
        SizedBoxHeight.height23(context: context),
        LeftPaddingComponent(
          leftPercent: 0.015,
          child: CustomBodyDrawer(
            text: 'Language',
            onPressed: () {},
            image: Assets.images.languagesImage.path,
          ),
        ),
        SizedBoxHeight.height23(context: context),
        CustomBodyDrawer(
          text: 'My Parcels',
          onPressed: () {
            pushGoRouterHelper(context: context, view: kMyShipmentViewRouter);
          },
          image: Assets.images.myParcelImage.path,
        ),
      ],
    );
  }
}
