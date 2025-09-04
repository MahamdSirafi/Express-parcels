import 'package:flutter/material.dart';
import 'package:spl/features/service_center_details/presentation/managers/models/operating_hours_details_model.dart';
import 'package:spl/features/service_center_details/presentation/views/widgets/custom_image_opening_time_table.dart';
import 'package:spl/features/service_center_details/presentation/views/widgets/custom_text_opening_time_table.dart';
import 'package:spl/features/service_center_details/presentation/views/widgets/custom_text_time_opening_time_table.dart';
import 'package:spl/features/service_center_details/presentation/views/widgets/custom_underscore_opening_time_table.dart';

TableRow tableRowOpeningTimeHelper({
  required OperatingHoursDetailsModel operatingHours,
}) {
  return TableRow(
    children: [
      CustomImageOpeningTimeTable(operatingHoursDetailsModel: operatingHours),
      CustomTextOpeningTimeTable(operatingHoursDetailsModel: operatingHours),
      CustomUnderscoreOpeningTimeTable(),
      CustomTextTimeOpeningTimeTable(
        operatingHoursDetailsModel: operatingHours,
      ),
    ],
  );
}
