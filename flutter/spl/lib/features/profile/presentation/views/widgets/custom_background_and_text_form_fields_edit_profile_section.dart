import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/background_text_fields_component.dart';
import 'package:spl/features/profile/presentation/views/widgets/custom_all_text_fields_edit_profile.dart';

class CustomBackgroundAndTextFormFieldsEditProfileSection
    extends StatelessWidget {
  const CustomBackgroundAndTextFormFieldsEditProfileSection({
    super.key,
    required this.fullNameTextEditingController,
    required this.emailTextEditingController,
    required this.phoneTextEditingController,
  });
  final TextEditingController fullNameTextEditingController,
      emailTextEditingController,
      phoneTextEditingController;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return BackgroundTextFieldsComponent(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.037,
          vertical: size.height * 0.04,
        ),
        child: CustomAllTextFieldsEditProfile(
          fullNameTextEditingController: fullNameTextEditingController,
          emailTextEditingController: emailTextEditingController,
          phoneTextEditingController: phoneTextEditingController,
        ),
      ),
    );
  }
}
