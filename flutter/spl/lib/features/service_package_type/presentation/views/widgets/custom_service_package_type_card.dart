import 'package:flutter/material.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/features/service_package_type/presentation/managers/models/service_package_type_model.dart';
import 'package:spl/features/service_package_type/presentation/views/widgets/custom_contain_service_pacakge_type_card.dart';

class CustomServicePackageTypeCard extends StatelessWidget {
  const CustomServicePackageTypeCard({
    super.key,
    required this.servicePackageTypeList,
    required this.index,
  });
  final List<ServicePackageTypeModel> servicePackageTypeList;
  final int index;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      margin: EdgeInsets.only(
        left: size.width * 0.037,
        right: size.width * 0.037,
        bottom: size.height * 0.021,
      ),
      padding: EdgeInsets.only(
        left: size.width * 0.06,
        bottom: size.height * 0.035,
        top: size.height * 0.021,
        right: size.width * 0.015,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.height * 0.042),
        color: StyleToColors.whiteColor,
        border: Border.all(color: StyleToColors.mediumSkyBlueColor),
        boxShadow: [
          BoxShadow(
            blurRadius: 52,
            offset: Offset(0, size.height * 0.028),
            color: StyleToColors.blackColor.withAlpha(50),
          ),
        ],
      ),
      child: CustomContainServicePacakgeTypeCard(
        servicePackageTypeList: servicePackageTypeList,
        index: index,
      ),
    );
  }
}
