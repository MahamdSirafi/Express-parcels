import 'package:flutter/material.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/features/service_center_details/presentation/managers/models/service_center_details_model.dart';
import 'package:spl/features/service_center_details/presentation/views/widgets/custom_contain_opening_time_table.dart';

class CustomOpeningTimeTable extends StatelessWidget {
  const CustomOpeningTimeTable({
    super.key,
    required this.serviceCenterDetailsModel,
  });
  final ServiceCenterDetailsModel serviceCenterDetailsModel;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      margin: EdgeInsets.only(
        left: size.width * 0.1,
        right: size.width * 0.085,
      ),
      padding: EdgeInsets.only(
        left: size.width * 0.05,
        right: size.width * 0.05,
      ),
      decoration: BoxDecoration(
        color: StyleToColors.whiteColor,
        border: Border.all(color: StyleToColors.mediumSkyBlueColor),
        borderRadius: BorderRadius.circular(size.height * 0.033),
      ),
      child: CustomContainOpeningTimeTable(
        serviceCenterDetailsModel: serviceCenterDetailsModel,
      ),
    );
  }
}
