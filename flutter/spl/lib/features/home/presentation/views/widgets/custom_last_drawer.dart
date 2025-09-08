import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/components/left_padding_component.dart';
import 'package:spl/core/utils/components/text_button_with_just_text.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/helpers/show_dialog_log_out_helper.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_width.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomLastDrawer extends StatefulWidget {
  const CustomLastDrawer({super.key});

  @override
  State<CustomLastDrawer> createState() => _CustomLastDrawerState();
}

class _CustomLastDrawerState extends State<CustomLastDrawer> {
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
    return LeftPaddingComponent(
      leftPercent: 0.07,
      child: Row(
        children: [
          Assets.images.logOutImage.image(),
          SizedBoxWidth.width15(context: context),
          TextButtonWithJustText(
            text: isSelected == true ? 'تسجيل الخروج' : 'Log Out',
            onPressed: () => showDialogLogOutHelper(context: context),
            style: StyleToTexts.textStyleBold16(
              context: context,
            ).copyWith(color: StyleToColors.blackColor),
          ),
        ],
      ),
    );
  }
}
