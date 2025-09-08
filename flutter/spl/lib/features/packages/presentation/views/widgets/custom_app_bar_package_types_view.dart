import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/components/back_arrow_image_component.dart';
import 'package:spl/core/utils/components/custom_text_bold_26.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';

class CustomAppBarPackageTypesView extends StatefulWidget {
  const CustomAppBarPackageTypesView({super.key});

  @override
  State<CustomAppBarPackageTypesView> createState() =>
      _CustomAppBarPackageTypesViewState();
}

class _CustomAppBarPackageTypesViewState
    extends State<CustomAppBarPackageTypesView> {
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
    double width = MediaQuery.sizeOf(context).width;
    getOnBoolValueFromSharedPreferences();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: width * 0.037),
          child: const BackArrowImageComponent(),
        ),
        SizedBoxHeight.height10(context: context),
        Padding(
          padding: EdgeInsets.only(left: width * 0.074),
          child: TextBold26Component(
            text: isSelected == true ? 'أنواع الحزم' : 'Package Types',
          ),
        ),
      ],
    );
  }
}
