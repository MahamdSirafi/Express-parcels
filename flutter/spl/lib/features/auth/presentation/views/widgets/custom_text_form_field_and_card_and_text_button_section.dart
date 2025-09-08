import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/helpers/pop_go_router_helper.dart';
import 'package:spl/core/utils/helpers/push_go_router_helper.dart';
import 'package:spl/core/utils/helpers/show_snack_bar_with_action_helper.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';
import 'package:spl/core/utils/components/card_contain_on_text_component.dart';
import 'package:spl/core/utils/components/text_button_with_just_text.dart';
import 'package:spl/core/utils/components/text_form_field_with_prefix_and_suffix_icons_and_hint_and_up_text_component.dart';
import 'package:spl/features/auth/presentation/managers/cubits/auth_cubit/auth_cubit.dart';
import 'package:spl/features/auth/presentation/managers/cubits/auth_cubit/auth_state.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomTextFormFieldAndCardAndTextButtonSection extends StatefulWidget {
  const CustomTextFormFieldAndCardAndTextButtonSection({super.key});

  @override
  State<CustomTextFormFieldAndCardAndTextButtonSection> createState() =>
      _CustomTextFormFieldAndCardAndTextButtonSectionState();
}

class _CustomTextFormFieldAndCardAndTextButtonSectionState
    extends State<CustomTextFormFieldAndCardAndTextButtonSection> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController emailTextEditingController;
  bool? isSelected = false;
  @override
  void initState() {
    super.initState();
    emailTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailTextEditingController.dispose();
  }

  Future<void> getOnBoolValueFromSharedPreferences() async {
    isSelected =
        await BoolSharedPreferencesClass.getBoolParameterSharedPreferences(
          keyBool: kStringKeyFlutterSwitchInSharedPreferences,
        );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    getOnBoolValueFromSharedPreferences();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is FailureAuthState) {
          showSnackBarWithActionHelper(
            context: context,
            text: state.errorMessageInFailureState,
          );
        } else if (state is SuccessAuthState) {
          final token = state.token;
          if (token != null && token.isNotEmpty) {
            pushGoRouterHelper(
              context: context,
              view: kResetPasswordViewRouter,
              extra: token,
              //this extra will take it(token) to view i will navigate to it
            );
            showSnackBarWithActionHelper(
              context: context,
              text:
                  isSelected == true
                      ? 'تم إرسال بريد إلكتروني لإعادة تعيين كلمة المرور'
                      : 'Password Reset Email Sent',
              color: StyleToColors.greenColor,
            );
          } else {
            showSnackBarWithActionHelper(
              context: context,
              text:
                  isSelected == true
                      ? 'لم يتم استلام الرمز حتى الآن'
                      : 'No token received for yet',
            );
          }
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.035),
                child:
                    TextFormFieldWithPrefixAndSuffixIconsAndHintAndUpTextComponent(
                      text:
                          isSelected == true
                              ? 'عنوان البريد الإلكتروني'
                              : 'Email Address',
                      textEditingController: emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      hintText:
                          isSelected == true
                              ? 'مثال@gmail.com'
                              : 'example@gmail.com',
                      prefixIcon: Assets.images.emailImage.path,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return isSelected == true
                              ? 'حقل البريد الإلكتروني مطلوب'
                              : 'The email field\'s required';
                        } else if (!value.contains('@gmail.com')) {
                          return isSelected == true
                              ? 'يجب عليك إضافة @gmail.com'
                              : 'You must add @gmail.com';
                        }
                        return null;
                      },
                    ),
              ),
              SizedBoxHeight.height35(context: context),
              CardContainOnTextComponent(
                text:
                    isSelected == true
                        ? 'إعادة تعيين كلمة المرور'
                        : 'Reset Password',
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    await context.read<AuthCubit>().forgetPasswordMethodInCubit(
                      email: emailTextEditingController.text.trim(),
                    );
                  }
                },
              ),
              SizedBoxHeight.height8(context: context),
              TextButtonWithJustText(
                text:
                    isSelected == true
                        ? 'العودة إلى تسجيل الدخول'
                        : 'Back to Login',
                onPressed: () {
                  popGoRouterHelper(context: context);
                },
                style: StyleToTexts.textStyleNormal22(context: context),
              ),
            ],
          ),
        );
      },
    );
  }
}
