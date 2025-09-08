import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/helpers/push_go_router_helper.dart';
import 'package:spl/core/utils/helpers/show_snack_bar_with_action_helper.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/features/auth/presentation/managers/cubits/auth_cubit/auth_cubit.dart';
import 'package:spl/features/auth/presentation/managers/cubits/auth_cubit/auth_state.dart';
import 'package:spl/features/auth/presentation/views/widgets/custom_app_bar_and_texts_login_section.dart';
import 'package:spl/core/utils/components/card_contain_on_text_component.dart';
import 'package:spl/features/auth/presentation/views/widgets/custom_text_form_fields_and_forget_password_login.dart';
import 'package:spl/features/auth/presentation/views/widgets/custom_texts_navigate_to_signup_view.dart';

class CustomLoginViewBody extends StatefulWidget {
  const CustomLoginViewBody({super.key});

  @override
  State<CustomLoginViewBody> createState() => _CustomLoginViewBodyState();
}

class _CustomLoginViewBodyState extends State<CustomLoginViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController emailTextEditingController,
      passwordTextEditingController;
  bool? isSelected = false;
  @override
  void initState() {
    super.initState();
    emailTextEditingController = TextEditingController();
    passwordTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
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
    getOnBoolValueFromSharedPreferences();
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is FailureAuthState) {
                showSnackBarWithActionHelper(
                  context: context,
                  text: state.errorMessageInFailureState,
                );
              } else if (state is SuccessAuthState) {
                pushGoRouterHelper(context: context, view: kHomeViewRouter);
                showSnackBarWithActionHelper(
                  context: context,
                  text:
                      isSelected == true
                          ? 'تم تسجيل الدخول بنجاح'
                          : 'LogIn Successful',
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
                    const CustomAppBarAndTextsLoginSection(),
                    CustomTextFormFieldsAndForgetPasswordLogin(
                      emailTextEditingController: emailTextEditingController,
                      passwordTextEditingController:
                          passwordTextEditingController,
                      //you know a:b two attributes(a take from b and b take from a), because i want right side take value from left side to use this value in cubit
                    ),
                    SizedBoxHeight.heightExpanded,
                    CardContainOnTextComponent(
                      text: isSelected == true ? 'تسجيل الدخول' : 'LogIn',
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          await context.read<AuthCubit>().loginMethodInCubit(
                            email: emailTextEditingController.text.trim(),
                            password: passwordTextEditingController.text.trim(),
                          );
                        }
                      },
                    ),
                    const CustomTextsNavigateToSignupView(),
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
