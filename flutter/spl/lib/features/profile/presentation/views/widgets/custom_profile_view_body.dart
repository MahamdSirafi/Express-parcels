import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/back_arrow_with_text_component.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/features/profile/presentation/views/widgets/custom_all_details_profile_section.dart';
import 'package:spl/features/profile/presentation/views/widgets/custom_image_person_profile.dart';

class CustomProfileViewBody extends StatelessWidget {
  const CustomProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBoxHeight.height33(context: context),
        const BackArrowWithTextComponent(text: 'your profile'),
        SizedBoxHeight.height23(context: context),
        const CustomImagePersonProfile(),
        SizedBoxHeight.height5(context: context),
        const CustomAllDetailsProfileSection(),
      ],
    );
  }
}
