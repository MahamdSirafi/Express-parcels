import 'package:flutter/material.dart';
import 'package:spl/features/my_shipment/presentation/views/widgets/custom_body_shipment_card.dart';
import 'package:spl/features/my_shipment/presentation/views/widgets/custom_header_shipment_card.dart';
import 'package:spl/features/my_shipment/presentation/views/widgets/custom_two_text_shipment_card.dart';

class CustomContainMyShipmentCard extends StatelessWidget {
  const CustomContainMyShipmentCard({
    super.key,
    required this.title,
    required this.index,
    required this.onPressed,
  });
  final String title;
  final int index;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomHeaderShipmentCard(title: title),
        const CustomTwoTextShipmentCard(),
        CustomBodyShipmentCard(index: index, onPressed: onPressed),
      ],
    );
  }
}
