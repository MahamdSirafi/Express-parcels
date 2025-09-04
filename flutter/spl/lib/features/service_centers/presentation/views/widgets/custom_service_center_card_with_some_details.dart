import 'package:flutter/material.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/features/service_centers/presentation/managers/models/service_centers_model.dart';
import 'package:spl/features/service_centers/presentation/views/widgets/custom_contain_service_center_card_with_some_details.dart';

class CustomServiceCenterCardWithSomeDetails extends StatelessWidget {
  const CustomServiceCenterCardWithSomeDetails({
    super.key,
    required this.listOfServiceCenters,
    required this.index,
  });
  final List<ServiceCentersModel> listOfServiceCenters;
  final int index;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      padding: EdgeInsets.only(
        top: size.height * 0.014,
        left: size.width * 0.037,
        right: size.width * 0.037,
        bottom: size.height * 0.014,
      ),
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.037),
      decoration: BoxDecoration(
        color: StyleToColors.whiteColor,
        borderRadius: BorderRadius.circular(size.height * 0.042),
        boxShadow: [
          BoxShadow(
            blurRadius: 52,
            offset: Offset(0, size.height * 0.028),
            color: StyleToColors.blackColor.withAlpha(25),
          ),
        ],
      ),
      child: CustomContainServiceCenterCardWithSomeDetails(
        listOfServiceCenters: listOfServiceCenters,
        index: index,
      ),
    );
  }
}
