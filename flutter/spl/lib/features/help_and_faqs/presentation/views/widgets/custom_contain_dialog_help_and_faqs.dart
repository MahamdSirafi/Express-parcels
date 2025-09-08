// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/helpers/alert_show_dialog_help_and_faqs_helper.dart';
import 'package:spl/core/utils/helpers/pop_go_router_helper.dart';
import 'package:spl/core/utils/helpers/show_snack_bar_without_action_helper.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/features/help_and_faqs/presentation/managers/cubits/help_and_faqs_cubit/help_and_faqs_cubit.dart';
import 'package:spl/features/help_and_faqs/presentation/managers/cubits/help_and_faqs_cubit/help_and_faqs_state.dart';
import 'package:spl/features/help_and_faqs/presentation/views/widgets/custom_header_dialog_help_and_faqs.dart';
import 'package:spl/features/help_and_faqs/presentation/views/widgets/custom_text_button_help_and_faqs.dart';

class CustomContainDialogHelpAndFaqs extends StatefulWidget {
  const CustomContainDialogHelpAndFaqs({super.key});

  @override
  State<CustomContainDialogHelpAndFaqs> createState() =>
      _CustomContainDialogHelpAndFaqsState();
}

class _CustomContainDialogHelpAndFaqsState
    extends State<CustomContainDialogHelpAndFaqs> {
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
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBoxHeight.height30(context: context),
        const CustomHeaderDialogHelpAndFaqs(),
        SizedBoxHeight.height23(context: context),
        BlocConsumer<HelpAndFaqsCubit, HelpAndFaqsState>(
          listener: (context, state) {
            if (state is SuccessHelpAndFaqsState) {
              popGoRouterHelper(context: context);
              alertShowDialogHelpAndFaqsHelper(context: context);
            } else if (state is FailureHelpAndFaqsState) {
              showSnackBarWithoutActionHelper(
                context: context,
                text: state.errorMessageInFailureState,
              );
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                if (state is LoadingHelpAndFaqsState)
                  const Center(child: CircularProgressIndicator()),
                if (state is! LoadingHelpAndFaqsState)
                  //if state was(success or failure i will trigger the cubit method and get on result)
                  CustomTextButtonHelpAndFaqs(
                    backgroundColor: StyleToColors.mediumRedColor,
                    text: isSelected == true ? 'حذف الحساب' : 'Delete Account',
                    onPressed: () async {
                      await context
                          .read<HelpAndFaqsCubit>()
                          .deleteAccountMethodInCubit();
                    },
                  ),
                SizedBoxHeight.height5(context: context),
                CustomTextButtonHelpAndFaqs(
                  backgroundColor: StyleToColors.greyColor,
                  text: isSelected == true ? 'يلغي' : 'Cancel',
                  onPressed: () => popGoRouterHelper(context: context),
                ),
                SizedBoxHeight.height30(context: context),
              ],
            );
          },
        ),
      ],
    );
  }
}
