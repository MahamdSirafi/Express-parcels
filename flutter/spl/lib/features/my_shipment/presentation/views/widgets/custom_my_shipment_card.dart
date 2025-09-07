import 'package:flutter/material.dart';
import 'package:spl/features/my_shipment/presentation/views/widgets/custom_background_shipment_card.dart';
import 'package:spl/features/my_shipment/presentation/views/widgets/custom_contain_my_shipment_card.dart';

class CustomMyShipmentCard extends StatelessWidget {
  const CustomMyShipmentCard({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return CustomBackgroundShipmentCard(
      child: CustomContainMyShipmentCard(title: title),
    );
  }
}
