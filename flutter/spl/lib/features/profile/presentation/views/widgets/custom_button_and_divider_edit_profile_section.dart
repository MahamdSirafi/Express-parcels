import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/components/card_contain_on_text_component.dart';
import 'package:spl/core/utils/components/divider_component.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';

class CustomButtonAndDividerEditProfileSection extends StatefulWidget {
  const CustomButtonAndDividerEditProfileSection({
    super.key,
    required this.formKey,
    required this.onTap,
  });
  final GlobalKey<FormState> formKey;
  final void Function() onTap;

  @override
  State<CustomButtonAndDividerEditProfileSection> createState() =>
      _CustomButtonAndDividerEditProfileSectionState();
}

class _CustomButtonAndDividerEditProfileSectionState
    extends State<CustomButtonAndDividerEditProfileSection> {
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
    return Column(
      children: [
        CardContainOnTextComponent(text: 'Save', onTap: widget.onTap),
        const DividerComponent(
          color: StyleToColors.deepBlueColor,
          thickness: 3,
          percentEndIndent: 0.29,
          percentEndent: 0.29,
        ),
      ],
    );
  }
}
