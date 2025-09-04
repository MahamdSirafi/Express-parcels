import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/features/service_center_details/presentation/managers/models/operating_hours_details_model.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomImageOpeningTimeTable extends StatelessWidget {
  const CustomImageOpeningTimeTable({
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
        child: SvgPicture.asset(
          Assets.images.whiteCheckImage.path,
          colorFilter: ColorFilter.mode(
            operatingHoursDetailsModel.start == 'closed' ||
                    operatingHoursDetailsModel.end == 'closed'
                ? StyleToColors.littleGreyLevel1Color
                : StyleToColors.littleNeonGreenColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
