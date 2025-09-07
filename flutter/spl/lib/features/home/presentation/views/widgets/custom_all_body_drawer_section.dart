import 'package:flutter/material.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/helpers/push_go_router_helper.dart';
import 'package:spl/core/utils/helpers/show_snack_bar_without_action_helper.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
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
          onPressed: () {
            showSnackBarWithoutActionHelper(
              context: context,
              color: StyleToColors.greenColor,
              text:
                  'The SPL app is a modern Flutter-based solution for managing and transitioning products efficiently, It provides a smooth user experience with clean UI, real-time updates, and secure data handling. Designed for businesses handling product logistics, the app simplifies product tracking, categorization, and movement across different stages of transition.',
            );
          },
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
        // LeftPaddingComponent(
        //   leftPercent: 0.015,
        //   child: CustomBodyDrawer(
        //     text: 'Language',
        //     onPressed: () {},
        //     image: Assets.images.languagesImage.path,
        //   ),
        // ),
        // SizedBoxHeight.height23(context: context),
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
