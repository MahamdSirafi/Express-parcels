import 'package:flutter/material.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/features/my_shipment/presentation/views/widgets/custom_date_details_section.dart';
import 'package:spl/features/my_shipment/presentation/views/widgets/custom_site_details_section.dart';

class CustomDetailsShipmentCard extends StatelessWidget {
  const CustomDetailsShipmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomDateDetailsSection(),
        SizedBoxHeight.height9(context: context),
        const CustomSiteDetailsSection(),
      ],
    );
  }
}
