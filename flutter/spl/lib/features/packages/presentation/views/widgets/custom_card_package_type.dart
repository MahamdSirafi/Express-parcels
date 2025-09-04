import 'package:flutter/material.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/features/packages/presentation/managers/models/package_type_model.dart';
import 'package:spl/features/packages/presentation/views/widgets/custom_contain_card_package_type.dart';

class CustomCardPackageType extends StatelessWidget {
  const CustomCardPackageType({
    super.key,
    required this.packageTypeList,
    required this.index,
  });
  final List<PackageTypeModel> packageTypeList;
  final int index;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      padding: EdgeInsets.only(
        left: size.width * 0.05,
        right: size.width * 0.01,
        top: size.height * 0.007,
        bottom: size.height * 0.007,
      ),
      margin: EdgeInsets.only(
        left: size.width * 0.037,
        right: size.width * 0.037,
        bottom: size.height * 0.021,
      ),
      decoration: BoxDecoration(
        color: StyleToColors.whiteColor,
        borderRadius: BorderRadius.circular(size.height * 0.033),
        boxShadow: [
          BoxShadow(
            blurRadius: 52,
            offset: Offset(0, size.height * 0.028),
            color: StyleToColors.blackColor.withAlpha(50),
          ),
        ],
      ),
      child: CustomContainCardPackageType(
        packageTypeList: packageTypeList,
        index: index,
      ),
    );
  }
}
