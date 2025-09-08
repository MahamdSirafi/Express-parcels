import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/components/back_arrow_with_text_component.dart';
import 'package:spl/core/utils/components/text_form_field_prefix_and_suffix_icons_and_hint_component.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/features/my_shipment/presentation/views/widgets/custom_all_shipment.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomMyShipmentViewBody extends StatefulWidget {
  const CustomMyShipmentViewBody({super.key});

  @override
  State<CustomMyShipmentViewBody> createState() =>
      _CustomMyShipmentViewBodyState();
}

class _CustomMyShipmentViewBodyState extends State<CustomMyShipmentViewBody> {
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
      children: [
        SizedBoxHeight.height23(context: context),
        BackArrowWithTextComponent(
          text: isSelected == true ? 'طرودى' : 'My Parcels',
        ),
        SizedBoxHeight.height15(context: context),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.073),
          child: TextFormFieldWithPrefixAndSuffixIconsAndHintComponent(
            hintText: isSelected == true ? 'يبحث' : 'search',
            suffixIcon: Assets.images.searchImage.path,
          ),
        ),
        SizedBoxHeight.height23(context: context),
        const Expanded(child: CustomAllShipment()),
      ],
    );
  }
}
