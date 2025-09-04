import 'package:flutter/material.dart';
import 'package:spl/features/home/presentation/views/widgets/custom_contain_service_center_card.dart';

class CustomServiceCenterCard extends StatelessWidget {
  const CustomServiceCenterCard({
    super.key,
    required this.color,
    required this.city,
    required this.street,
  });
  final Color color;
  final String city, street;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      width: size.width * 0.265,
      height: size.height * 0.155,
      padding: EdgeInsets.only(
        bottom: size.height * 0.0068,
        top: size.height * 0.023,
        right: size.width * 0.012,
        left: size.width * 0.024,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(size.height * 0.033),
      ),
      child: CustomContainServiceCenterCard(city: city, street: street),
    );
  }
}
