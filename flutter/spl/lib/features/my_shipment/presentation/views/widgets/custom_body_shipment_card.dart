import 'package:flutter/material.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_width.dart';
import 'package:spl/features/my_shipment/presentation/views/widgets/custom_details_shipment_card.dart';
import 'package:spl/features/my_shipment/presentation/views/widgets/custom_get_on_product_from_what.dart';

class CustomBodyShipmentCard extends StatelessWidget {
  const CustomBodyShipmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CustomDetailsShipmentCard(),
        SizedBoxWidth.widthExpanded,
        CustomGetOnProductFromWhat(),
      ],
    );
  }
}
