import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/helpers/push_go_router_helper.dart';
import 'package:spl/core/utils/helpers/show_dialog_log_out_helper.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/features/profile/presentation/views/widgets/custom_details_profile.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomAllDetailsProfileSection extends StatefulWidget {
  const CustomAllDetailsProfileSection({super.key});

  @override
  State<CustomAllDetailsProfileSection> createState() =>
      _CustomAllDetailsProfileSectionState();
}

class _CustomAllDetailsProfileSectionState
    extends State<CustomAllDetailsProfileSection> {
  bool? isSelected = false;
  Future<void> getOnBoolValueFromSharedPreferences() async {
    isSelected =
        await BoolSharedPreferencesClass.getBoolParameterSharedPreferences(
          keyBool: kStringKeyFlutterSwitchInSharedPreferences,
        );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    getOnBoolValueFromSharedPreferences();
    return Column(
      children: [
        CustomDetailsProfile(
          percentLeftPadding: 0.04,
          percentHeightImage: 0.0435,
          image: Assets.images.editImageP.path,
          text: isSelected == true ? 'تعديل الملف الشخصي' : 'Edit Profile',
          onPressed:
              () => pushGoRouterHelper(
                context: context,
                view: kEditProfileButtonViewRouter,
              ),
        ),
        SizedBoxHeight.height10(context: context),
        CustomDetailsProfile(
          image: Assets.images.starImage.path,
          text: isSelected == true ? 'تقييماتي' : 'My Ratings',
          onPressed:
              () => pushGoRouterHelper(
                context: context,
                view: kMyRatingsViewRouter,
              ),
        ),
        SizedBoxHeight.height10(context: context),
        CustomDetailsProfile(
          image: Assets.images.questionImage.path,
          text:
              isSelected == true ? 'المساعدة والأسئلة الشائعة' : 'Help &FAQ\'S',
          onPressed:
              () => pushGoRouterHelper(
                context: context,
                view: kHelpAndFaqsViewRouter,
              ),
        ),
        SizedBoxHeight.height10(context: context),
        CustomDetailsProfile(
          image: Assets.images.circleLogOutImage.path,
          text: isSelected == true ? 'تسجيل الخروج' : 'LogOut',
          onPressed: () => showDialogLogOutHelper(context: context),
        ),
      ],
    );
  }
}
