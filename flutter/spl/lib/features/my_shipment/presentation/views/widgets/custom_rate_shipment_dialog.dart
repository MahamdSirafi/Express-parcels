import 'package:flutter/material.dart';
import 'package:spl/features/my_shipment/presentation/views/widgets/custom_contain_rate_shipment_dialog.dart';

class CustomRateShipmentDialog extends StatelessWidget {
  const CustomRateShipmentDialog({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(size.height * 0.033),
      ),
      child: const CustomContainRateShipmentDialog(),
    );
  }
}
