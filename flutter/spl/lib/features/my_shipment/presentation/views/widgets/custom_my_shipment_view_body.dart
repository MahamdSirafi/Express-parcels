import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/back_arrow_with_text_component.dart';
import 'package:spl/core/utils/components/text_form_field_prefix_and_suffix_icons_and_hint_component.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/features/my_shipment/presentation/views/widgets/custom_all_shipment.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomMyShipmentViewBody extends StatelessWidget {
  const CustomMyShipmentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        SizedBoxHeight.height23(context: context),
        BackArrowWithTextComponent(text: 'My Parcels'),
        SizedBoxHeight.height15(context: context),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.073),
          child: TextFormFieldWithPrefixAndSuffixIconsAndHintComponent(
            hintText: 'search',
            suffixIcon: Assets.images.searchImage.path,
          ),
        ),
        SizedBoxHeight.height23(context: context),
        const Expanded(child: CustomAllShipment()),
      ],
    );
  }
}
