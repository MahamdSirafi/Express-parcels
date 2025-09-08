import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/components/back_with_two_texts_component.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';

class CustomAppBarWithSizedBoxServicePackageTypeCard extends StatefulWidget {
  const CustomAppBarWithSizedBoxServicePackageTypeCard({super.key});

  @override
  State<CustomAppBarWithSizedBoxServicePackageTypeCard> createState() =>
      _CustomAppBarWithSizedBoxServicePackageTypeCardState();
}

class _CustomAppBarWithSizedBoxServicePackageTypeCardState
    extends State<CustomAppBarWithSizedBoxServicePackageTypeCard> {
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
    return SliverToBoxAdapter(
      child: Column(
        children: [
          SizedBoxHeight.height23(context: context),
          BackArrowWithTwoTextsComponent(
            firstText: isSelected == true ? 'أنواع الشحن' : 'Types of shipping',
            secondText:
                isSelected == true ? 'الخدمات المتاحة' : 'services available',
          ),
          SizedBoxHeight.height30(context: context),
        ],
      ),
    );
  }
}
