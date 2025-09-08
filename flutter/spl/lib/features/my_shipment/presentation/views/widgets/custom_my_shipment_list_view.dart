import 'package:flutter/material.dart';
import 'package:spl/core/utils/lists/product_my_shipment_list.dart';
import 'package:spl/features/my_shipment/presentation/views/widgets/custom_body_shipment_card.dart';
import 'package:spl/features/my_shipment/presentation/views/widgets/custom_my_shipment_card.dart';

class CustomMyShipmentListView extends StatefulWidget {
  const CustomMyShipmentListView({super.key});

  @override
  State<CustomMyShipmentListView> createState() =>
      _CustomMyShipmentListViewState();
}

class _CustomMyShipmentListViewState extends State<CustomMyShipmentListView> {
  List<String> productsMyShipmentList = [
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
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: productsMyShipmentList.length,
      itemBuilder: (context, index) {
        return CustomMyShipmentCard(
          title: productsMyShipmentList[index],
          index: index,
          onPressed: () {
            productsMyShipmentList.removeAt(index);
            setState(() {});
          },
        );
      },
    );
  }
}
