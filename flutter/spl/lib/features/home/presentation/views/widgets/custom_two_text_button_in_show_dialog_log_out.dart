// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/helpers/go_go_router_helper.dart';
import 'package:spl/core/utils/helpers/pop_go_router_helper.dart';
import 'package:spl/core/utils/managers/cubits/logout_cubit/logout_cubit.dart';
import 'package:spl/core/utils/managers/cubits/logout_cubit/logout_state.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_width.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';
import 'package:spl/features/home/presentation/views/widgets/custom_text_button_show_dialog_log_out.dart';

class CustomTwoTextButtonInShowDialogLogOut extends StatefulWidget {
  const CustomTwoTextButtonInShowDialogLogOut({super.key});

  @override
  State<CustomTwoTextButtonInShowDialogLogOut> createState() =>
      _CustomTwoTextButtonInShowDialogLogOutState();
}

class _CustomTwoTextButtonInShowDialogLogOutState
    extends State<CustomTwoTextButtonInShowDialogLogOut> {
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
    return Row(
      children: [
        BlocBuilder<LogoutCubit, LogoutState>(
          builder: (context, state) {
            if (state is LougoutSuccessState) {
              return CustomTextButtonShowDialogLogOut(
                backgroundColor: StyleToColors.mediumRedColor,
                textColor: StyleToColors.mediumWhiteColor,
                text: isSelected == true ? 'نعم' : 'Yes',
                onPressed: () async {
                  await context.read<LogoutCubit>().logoutMethodInCubit();
                  goGoRouterHelper(context: context, view: kSplashViewRouter);
                },
              );
            } else if (state is LougoutFailureState) {
              return Center(
                child: Text(
                  state.errorMessageInCubit,
                  style: StyleToTexts.textStyleBold14(context: context),
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
        SizedBoxWidth.width15(context: context),
        CustomTextButtonShowDialogLogOut(
          backgroundColor: StyleToColors.greyColor,
          textColor: StyleToColors.whiteColor,
          text: isSelected == true ? 'يلغي' : 'Cancel',
          onPressed: () {
            popGoRouterHelper(context: context);
          },
        ),
      ],
    );
  }
}
