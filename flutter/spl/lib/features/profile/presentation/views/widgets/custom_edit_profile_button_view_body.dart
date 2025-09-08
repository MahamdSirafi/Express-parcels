import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/components/back_arrow_with_text_component.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/helpers/pop_go_router_helper.dart';
import 'package:spl/core/utils/helpers/show_snack_bar_with_action_helper.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/features/profile/presentation/managers/cubits/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:spl/features/profile/presentation/managers/cubits/edit_profile_cubit/edit_profile_state.dart';
import 'package:spl/features/profile/presentation/views/widgets/custom_background_and_text_form_fields_edit_profile_section.dart';
import 'package:spl/features/profile/presentation/views/widgets/custom_button_and_divider_edit_profile_section.dart';

class CustomEditProfileButtonViewBody extends StatefulWidget {
  const CustomEditProfileButtonViewBody({super.key});

  @override
  State<CustomEditProfileButtonViewBody> createState() =>
      _CustomEditProfileButtonViewBodyState();
}

class _CustomEditProfileButtonViewBodyState
    extends State<CustomEditProfileButtonViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController fullNameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  @override
  void dispose() {
    fullNameTextEditingController.dispose();
    emailTextEditingController.dispose();
    phoneTextEditingController.dispose();
    super.dispose();
  }

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
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: BlocConsumer<EditProfileCubit, EditProfileState>(
            listener: (context, state) {
              if (state is SuccessEditProfileState) {
                popGoRouterHelper(context: context);
                showSnackBarWithActionHelper(
                  context: context,
                  text:
                      isSelected == true
                          ? 'تم تعديل ملفك الشخصي بنجاح'
                          : 'your profile is successful edited',
                  color: StyleToColors.greenColor,
                );
              } else if (state is FailureEditProfileState) {
                showSnackBarWithActionHelper(
                  context: context,
                  text: state.errorMessageInFailureState,
                );
              }
            },
            builder: (context, state) {
              if (state is LoadingEditProfileState) {
                return const Center(child: CircularProgressIndicator());
              }
              return Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBoxHeight.height33(context: context),
                    BackArrowWithTextComponent(
                      text:
                          isSelected == true
                              ? 'تعديل الملف الشخصي'
                              : 'Edit profile',
                    ),
                    SizedBoxHeight.height40(context: context),
                    CustomBackgroundAndTextFormFieldsEditProfileSection(
                      fullNameTextEditingController:
                          fullNameTextEditingController,
                      emailTextEditingController: emailTextEditingController,
                      phoneTextEditingController: phoneTextEditingController,
                    ),
                    SizedBoxHeight.heightExpanded,
                    CustomButtonAndDividerEditProfileSection(
                      formKey: formKey,
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          await context
                              .read<EditProfileCubit>()
                              .editProfileCubit(
                                fullName:
                                    fullNameTextEditingController.text.trim(),
                                email: emailTextEditingController.text.trim(),
                                phone: phoneTextEditingController.text.trim(),
                              );
                        }
                      },
                    ),
                    SizedBoxHeight.height10(context: context),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
