import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/text_normal_10_component.dart';
import 'package:spl/core/utils/components/text_normal_12_component.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';
import 'package:spl/features/service_center_details/presentation/managers/models/operating_hours_details_model.dart';

class CustomTextTimeOpeningTimeTable extends StatelessWidget {
  const CustomTextTimeOpeningTimeTable({
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
        child:
            operatingHoursDetailsModel.start == 'closed' ||
                    operatingHoursDetailsModel.end == 'closed'
                ? TextNormal12Component(
                  text: operatingHoursDetailsModel.start,
                  color: StyleToColors.mediumRedColor,
                )
                : TextNormal10Component(
                  text:
                      '${operatingHoursDetailsModel.start} - ${operatingHoursDetailsModel.end}',
                  textColor: StyleToColors.blackColor,
                ),
      ),
    );
  }
}
