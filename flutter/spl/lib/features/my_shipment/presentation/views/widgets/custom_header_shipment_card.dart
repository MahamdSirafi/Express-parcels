import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/components/dot_component.dart';
import 'package:spl/core/utils/components/text_medium_14_component.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_width.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/features/my_shipment/presentation/views/widgets/custom_rate_text_button_my_shipment.dart';
import 'package:spl/core/utils/components/text_normal_10_component.dart';

class CustomHeaderShipmentCard extends StatefulWidget {
  const CustomHeaderShipmentCard({super.key, required this.title});
  final String title;

  @override
  State<CustomHeaderShipmentCard> createState() =>
      _CustomHeaderShipmentCardState();
}

class _CustomHeaderShipmentCardState extends State<CustomHeaderShipmentCard> {
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
        TextMedium14Component(
          text: widget.title,
          color: StyleToColors.blackColor,
        ),
        SizedBoxWidth.widthExpanded,
        CustomTextButtonMyShipment(),
        SizedBoxWidth.width13(context: context),
        TextNormal10Component(
          text: isSelected == true ? 'تم التوصيل' : 'Delivered',
        ),
        SizedBoxWidth.width5(context: context),
        const DotComponent(color: StyleToColors.littleNeonGreenColor),
      ],
    );
  }
}
