import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/components/back_arrow_with_text_component.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/features/profile/presentation/views/widgets/custom_all_details_profile_section.dart';
import 'package:spl/features/profile/presentation/views/widgets/custom_image_person_profile.dart';

class CustomProfileViewBody extends StatefulWidget {
  const CustomProfileViewBody({super.key});

  @override
  State<CustomProfileViewBody> createState() => _CustomProfileViewBodyState();
}

class _CustomProfileViewBodyState extends State<CustomProfileViewBody> {
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
    return Column(
      children: [
        SizedBoxHeight.height33(context: context),
        BackArrowWithTextComponent(
          text: isSelected == true ? 'ملفك الشخصي' : 'your profile',
        ),
        SizedBoxHeight.height23(context: context),
        const CustomImagePersonProfile(),
        SizedBoxHeight.height5(context: context),
        const CustomAllDetailsProfileSection(),
      ],
    );
  }
}
