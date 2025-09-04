import 'package:flutter/material.dart';
import 'package:spl/features/my_shipment/presentation/views/widgets/custom_body_shipment_card.dart';
import 'package:spl/features/my_shipment/presentation/views/widgets/custom_header_shipment_card.dart';
import 'package:spl/features/my_shipment/presentation/views/widgets/custom_two_text_shipment_card.dart';

class CustomContainMyShipmentCard extends StatelessWidget {
  const CustomContainMyShipmentCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomHeaderShipmentCard(),
        const CustomTwoTextShipmentCard(),
        const CustomBodyShipmentCard(),
      ],
    );
  }
}
