import 'package:flutter/material.dart';
import 'package:spl/core/utils/lists/product_my_shipment_list.dart';
import 'package:spl/features/my_shipment/presentation/views/widgets/custom_my_shipment_card.dart';

class CustomMyShipmentListView extends StatelessWidget {
  const CustomMyShipmentListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: productsMyShipmentList.length,
      itemBuilder: (context, index) {
        return CustomMyShipmentCard(title: productsMyShipmentList[index]);
      },
    );
  }
}
