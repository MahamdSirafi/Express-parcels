import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/components/text_normal_10_component.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_width.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomContainSurfCard extends StatefulWidget {
  const CustomContainSurfCard({super.key});

  @override
  State<CustomContainSurfCard> createState() => _CustomContainSurfCardState();
}

class _CustomContainSurfCardState extends State<CustomContainSurfCard> {
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBoxWidth.widthExpanded,
        TextNormal10Component(
          text: isSelected == true ? 'ركوب الأمواج' : 'Surf',
          textColor: StyleToColors.blackColor,
        ),
        SizedBoxWidth.widthExpanded,
        Assets.images.rightArrowDirectionImage.image(),
      ],
    );
  }
}
