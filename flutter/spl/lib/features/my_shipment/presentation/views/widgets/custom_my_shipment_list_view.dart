import 'package:flutter/material.dart';
import 'package:spl/features/my_shipment/presentation/views/widgets/custom_my_shipment_card.dart';

class CustomMyShipmentListView extends StatelessWidget {
  const CustomMyShipmentListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return CustomMyShipmentCard(title: products[index]);
      },
    );
  }
}

List<String> products = [
  'Laptop',
  'Smartphone',
  'Tablet',
  'Headphones',
  'Smartwatch',
  'Keyboard',
  'Mouse',
  'Monitor',
  'Printer',
  'External Hard Drive',
];
