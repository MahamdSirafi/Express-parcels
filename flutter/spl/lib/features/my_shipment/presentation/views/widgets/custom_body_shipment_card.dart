import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/lists/product_my_shipment_list.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_width.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/features/my_shipment/presentation/views/widgets/custom_details_shipment_card.dart';
import 'package:spl/features/my_shipment/presentation/views/widgets/custom_get_on_product_from_what.dart';
import 'package:spl/features/my_shipment/presentation/views/widgets/custom_rate_text_button_my_shipment.dart';

class CustomBodyShipmentCard extends StatefulWidget {
  const CustomBodyShipmentCard({
    super.key,
    required this.index,
    required this.onPressed,
  });
  final int index;
  final void Function() onPressed;

  @override
  State<CustomBodyShipmentCard> createState() => _CustomBodyShipmentCardState();
}

class _CustomBodyShipmentCardState extends State<CustomBodyShipmentCard> {
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
        CustomDetailsShipmentCard(),
        SizedBoxWidth.widthExpanded,
        CustomTextButtonMyShipment(
          onPressed: widget.onPressed,
          text: isSelected == true ? 'يلغي' : 'Cancel',
          textColor: StyleToColors.mediumRedColor,
          borderColor: StyleToColors.mediumRedColor,
        ),
        SizedBoxWidth.width10(context: context),
        CustomGetOnProductFromWhat(),
      ],
    );
  }
}
