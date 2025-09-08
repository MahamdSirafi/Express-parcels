import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/components/left_padding_component.dart';
import 'package:spl/core/utils/components/text_medium_20_component.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';

class CustomHeadDrawer extends StatefulWidget {
  const CustomHeadDrawer({super.key});

  @override
  State<CustomHeadDrawer> createState() => _CustomHeadDrawerState();
}

class _CustomHeadDrawerState extends State<CustomHeadDrawer> {
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
      leftPercent: 0.083,
      child: TextMedium20Component(
        text: isSelected == true ? 'إعدادات' : 'Settings',
      ),
    );
  }
}
