import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/text_bold_16_component.dart';
import 'package:spl/features/service_center_details/presentation/managers/models/operating_hours_details_model.dart';

class CustomTextOpeningTimeTable extends StatelessWidget {
  const CustomTextOpeningTimeTable({
    super.key,
    required this.operatingHoursDetailsModel,
  });
  final OperatingHoursDetailsModel operatingHoursDetailsModel;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.028),
      child: Center(
        child: TextBold16Component(text: operatingHoursDetailsModel.day),
      ),
    );
  }
}
