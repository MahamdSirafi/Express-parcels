import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/helpers/push_go_router_helper.dart';
import 'package:spl/core/utils/components/card_contain_on_text_component.dart';
import 'package:spl/core/utils/helpers/show_snack_bar_with_action_helper.dart';
import 'package:spl/core/utils/helpers/show_snack_bar_without_action_helper.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/features/auth/presentation/managers/cubits/auth_cubit/auth_cubit.dart';
import 'package:spl/features/auth/presentation/managers/cubits/auth_cubit/auth_state.dart';
import 'package:spl/features/auth/presentation/views/widgets/custom_text_form_field_reset_password.dart';

class CustomTextFormFieldsAndCardResetPasswordSection extends StatefulWidget {
  const CustomTextFormFieldsAndCardResetPasswordSection({
    super.key,
    required this.token,
  });
  final String token;
  @override
  State<CustomTextFormFieldsAndCardResetPasswordSection> createState() =>
      _CustomTextFormFieldsAndCardResetPasswordSectionState();
}

class _CustomTextFormFieldsAndCardResetPasswordSectionState
    extends State<CustomTextFormFieldsAndCardResetPasswordSection> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController newPasswordAndConfirmPasswordTextEditingController;
  @override
  void initState() {
    super.initState();
    newPasswordAndConfirmPasswordTextEditingController =
        TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    newPasswordAndConfirmPasswordTextEditingController.dispose();
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
    Size size = MediaQuery.sizeOf(context);
    getOnBoolValueFromSharedPreferences();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is FailureAuthState) {
          showSnackBarWithActionHelper(
            context: context,
            text: state.errorMessageInFailureState,
          );
        } else if (state is SuccessAuthState) {
          pushGoRouterHelper(
            context: context,
            view: kSuccessResetPasswordViewRouter,
          );
          showSnackBarWithoutActionHelper(
            context: context,
            text:
                isSelected == true
                    ? 'تمت إعادة تعيين كلمة المرور بنجاح'
                    : 'Password Reset Successful',
            color: StyleToColors.greenColor,
          );
        }
      },
      builder: (context, state) {
        if (state is LoadingAuthState) {
          return const Center(child: CircularProgressIndicator());
        }
        return Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextFormFieldResetPassword(
                hintText:
                    isSelected == true ? 'كلمة المرور الجديدة' : 'New password',
                textEditingController:
                    newPasswordAndConfirmPasswordTextEditingController,
                labelText:
                    isSelected == true
                        ? 'أدخل كلمة المرور الجديدة'
                        : 'Enter new password',
              ),
              SizedBoxHeight.height35(context: context),
              CustomTextFormFieldResetPassword(
                hintText:
                    isSelected == true
                        ? 'تأكيد كلمة المرور'
                        : 'Confirm password',
                textEditingController:
                    newPasswordAndConfirmPasswordTextEditingController,
                labelText:
                    isSelected == true
                        ? 'تأكيد كلمة المرور'
                        : 'Confirm password',
              ),
              SizedBoxHeight.height21(context: context),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.035),
                child: CardContainOnTextComponent(
                  text:
                      isSelected == true
                          ? 'تغيير كلمة المرور'
                          : 'Change Password',
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      pushGoRouterHelper(
                        context: context,
                        view: kSuccessResetPasswordViewRouter,
                      );
                      await context.read<AuthCubit>().resetPasswordMethodInCubit(
                        token: widget.token,
                        newPassword:
                            newPasswordAndConfirmPasswordTextEditingController
                                .text
                                .trim(),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
