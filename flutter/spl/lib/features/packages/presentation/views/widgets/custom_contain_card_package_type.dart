import 'package:flutter/material.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_width.dart';
import 'package:spl/features/packages/presentation/managers/models/package_type_model.dart';
import 'package:spl/features/packages/presentation/views/widgets/custom_left_side_contain_package_type.dart';
import 'package:spl/features/packages/presentation/views/widgets/custom_right_side_contain_package_type.dart';

class CustomContainCardPackageType extends StatelessWidget {
  const CustomContainCardPackageType({
    super.key,
    required this.packageTypeList,
    required this.index,
  });
  final List<PackageTypeModel> packageTypeList;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: CustomLeftSideContainPackageType(
            packageTypeList: packageTypeList,
            index: index,
          ),
        ),
        SizedBoxWidth.widthExpanded,
        CustomRightSideContainPackageType(),
      ],
    );
  }
}
