import 'package:flutter/material.dart';
import 'package:spl/core/utils/helpers/table_row_opening_time_helper.dart';
import 'package:spl/core/utils/lists/opening_hours_list.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/features/service_center_details/presentation/managers/models/operating_hours_details_model.dart';
import 'package:spl/features/service_center_details/presentation/managers/models/service_center_details_model.dart';

class CustomContainOpeningTimeTable extends StatelessWidget {
  const CustomContainOpeningTimeTable({
    super.key,
    required this.serviceCenterDetailsModel,
  });
  final ServiceCenterDetailsModel serviceCenterDetailsModel;
  @override
  Widget build(BuildContext context) {
    return Table(
      border: const TableBorder(
        horizontalInside: BorderSide(color: StyleToColors.mediumSkyBlueColor),
      ),
      children: List.generate(
        serviceCenterDetailsModel.operatingHoursModel.length,
        (index) {
          final OperatingHoursDetailsModel operatingHours =
              serviceCenterDetailsModel.operatingHoursModel[index];
          return tableRowOpeningTimeHelper(operatingHours: operatingHours);
        },
      ),
    );
  }
}
