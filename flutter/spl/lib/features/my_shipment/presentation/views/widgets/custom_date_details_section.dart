import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/components/text_normal_8_component.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_width.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/components/text_normal_10_component.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomDateDetailsSection extends StatefulWidget {
  const CustomDateDetailsSection({super.key});

  @override
  State<CustomDateDetailsSection> createState() =>
      _CustomDateDetailsSectionState();
}

class _CustomDateDetailsSectionState extends State<CustomDateDetailsSection> {
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
        Assets.images.dateImage.svg(
          colorFilter: const ColorFilter.mode(
            StyleToColors.deepBlueColor,
            BlendMode.srcIn,
          ),
        ),
        SizedBoxWidth.width9(context: context),
        TextNormal10Component(
          text: isSelected == true ? 'تاريخ الإنشاء' : 'Creation date',
        ),
        SizedBoxWidth.width5(context: context),
        const TextNormal8Component(
          text: '24.05.2025',
          textColor: StyleToColors.deepBlueColor,
        ),
      ],
    );
  }
}
