import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/components/text_normal_10_component.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_width.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomSiteDetailsSection extends StatefulWidget {
  const CustomSiteDetailsSection({super.key});

  @override
  State<CustomSiteDetailsSection> createState() =>
      _CustomSiteDetailsSectionState();
}

class _CustomSiteDetailsSectionState extends State<CustomSiteDetailsSection> {
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
    return Row(
      children: [
        Assets.images.locationBlackImageP.image(),
        SizedBoxWidth.width9(context: context),
        TextNormal10Component(
          text: isSelected == true ? 'دمشق عباسين' : 'Damascus Abbasin',
        ),
      ],
    );
  }
}
