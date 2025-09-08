import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/components/divider_component.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/helpers/push_go_router_helper.dart';
import 'package:spl/core/utils/helpers/show_snack_bar_with_action_helper.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/features/auth/presentation/managers/cubits/auth_cubit/auth_cubit.dart';
import 'package:spl/features/auth/presentation/managers/cubits/auth_cubit/auth_state.dart';
import 'package:spl/features/auth/presentation/views/widgets/custom_app_bar_register_view.dart';
import 'package:spl/core/utils/components/card_contain_on_text_component.dart';
import 'package:spl/features/auth/presentation/views/widgets/custom_text_fields_register.dart';

class CustomRegisterViewBody extends StatefulWidget {
  const CustomRegisterViewBody({super.key});

  @override
  State<CustomRegisterViewBody> createState() => _CustomRegisterViewBodyState();
}

class _CustomRegisterViewBodyState extends State<CustomRegisterViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController emailTextEditingController,
      passwordTextEditingController,
      fullNameTextEditingController,
      phoneTextEditingController;
  bool? isSelected = false;
  @override
  void initState() {
    super.initState();
    emailTextEditingController = TextEditingController();
    passwordTextEditingController = TextEditingController();
    fullNameTextEditingController = TextEditingController();
    phoneTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
    fullNameTextEditingController.dispose();
    phoneTextEditingController.dispose();
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
                          ? 'تم التسجيل بنجاح'
                          : 'SignUp Successful',
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
                    SizedBoxHeight.height32(context: context),
                    const CustomAppBarRegisterView(),
                    SizedBoxHeight.height29(context: context),
                    CustomTextFieldsRegister(
                      fullNameTextEditingController:
                          fullNameTextEditingController,
                      emailTextEditingController: emailTextEditingController,
                      passwordTextEditingController:
                          passwordTextEditingController,
                      phoneTextEditingController: phoneTextEditingController,
                    ),
                    SizedBoxHeight.heightExpanded,
                    CardContainOnTextComponent(
                      text: isSelected == true ? 'اشتراك' : 'Sign Up',
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          await context.read<AuthCubit>().signUpMethodInCubit(
                            email: emailTextEditingController.text.trim(),
                            fullName: fullNameTextEditingController.text.trim(),
                            phone: phoneTextEditingController.text.trim(),
                            password: passwordTextEditingController.text.trim(),
                          );
                        }
                      },
                    ),
                    const DividerComponent(
                      color: StyleToColors.deepBlueColor,
                      thickness: 3,
                      percentEndIndent: 0.29,
                      percentEndent: 0.29,
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
