import 'package:flutter/material.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/helpers/push_go_router_helper.dart';
import 'package:spl/core/utils/helpers/show_dialog_log_out_helper.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/features/profile/presentation/views/widgets/custom_details_profile.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomAllDetailsProfileSection extends StatelessWidget {
  const CustomAllDetailsProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomDetailsProfile(
          percentLeftPadding: 0.04,
          percentHeightImage: 0.0435,
          image: Assets.images.editImageP.path,
          text: 'Edit Profile',
          onPressed:
              () => pushGoRouterHelper(
                context: context,
                view: kEditProfileButtonViewRouter,
              ),
        ),
        SizedBoxHeight.height10(context: context),
        CustomDetailsProfile(
          image: Assets.images.starImage.path,
          text: 'My Ratings',
          onPressed:
              () => pushGoRouterHelper(
                context: context,
                view: kMyRatingsViewRouter,
              ),
        ),
        SizedBoxHeight.height10(context: context),
        CustomDetailsProfile(
          image: Assets.images.questionImage.path,
          text: 'Help &FAQ\'S',
          onPressed:
              () => pushGoRouterHelper(
                context: context,
                view: kHelpAndFaqsViewRouter,
              ),
        ),
        SizedBoxHeight.height10(context: context),
        CustomDetailsProfile(
          image: Assets.images.circleLogOutImage.path,
          text: 'LogOut',
          onPressed: () => showDialogLogOutHelper(context: context),
        ),
      ],
    );
  }
}
