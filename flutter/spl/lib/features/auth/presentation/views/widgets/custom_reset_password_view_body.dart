import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/components/text_bold_22_component.dart';
import 'package:spl/core/utils/components/text_medium_14_component.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/features/auth/presentation/views/widgets/custom_app_bar_reset_password.dart';
import 'package:spl/features/auth/presentation/views/widgets/custom_text_form_fields_and_card_reset_password_section.dart';

class CustomResetPasswordViewBody extends StatefulWidget {
  const CustomResetPasswordViewBody({super.key, required this.token});
  final String token;

  @override
  State<CustomResetPasswordViewBody> createState() =>
      _CustomResetPasswordViewBodyState();
}

class _CustomResetPasswordViewBodyState
    extends State<CustomResetPasswordViewBody> {
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
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBoxHeight.height21(context: context),
          const CustomAppBarResetPassword(),
          SizedBoxHeight.height72(context: context),
          TextBold22Component(
            text:
                isSelected == true
                    ? 'إعادة تعيين كلمة المرور'
                    : 'Reset Password',
            color: StyleToColors.blackColor,
          ),
          SizedBoxHeight.height8(context: context),
          TextMedium14Component(
            text:
                isSelected == true
                    ? 'من فضلك أدخل كلمة المرور الجديدة'
                    : 'Please, Enter your new password',
            color: StyleToColors.littleSilverColor,
          ),
          SizedBoxHeight.height21(context: context),
          CustomTextFormFieldsAndCardResetPasswordSection(token: widget.token),
        ],
      ),
    );
  }
}
