import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spl/core/utils/helpers/change_string_to_date_time_type_helper.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/features/packages/presentation/managers/models/package_type_model.dart';
import 'package:spl/features/packages/presentation/views/widgets/custom_image_with_two_texts_left_side.dart';
import 'package:spl/features/packages/presentation/views/widgets/custom_size_package_left_side.dart';
import 'package:spl/features/packages/presentation/views/widgets/custom_text_explain_about_package_type.dart';
import 'package:spl/core/utils/components/price_texts_package_type_component.dart';

class CustomLeftSideContainPackageType extends StatelessWidget {
  const CustomLeftSideContainPackageType({
    super.key,
    required this.packageTypeList,
    required this.index,
  });
  final List<PackageTypeModel> packageTypeList;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBoxHeight.height10(context: context),
        CustomSizePackageLeftSide(name: packageTypeList[index].name),
        SizedBoxHeight.height5(context: context),
        CustomImageWithTwoTextsLeftSide(
          firstText: 'Creation date',
          secondText: changeStringToDateTimeTypeHelper(
            text: packageTypeList[index].createdAt,
          ),
          svgOrPngImage: 'svg',
        ),
        SizedBoxHeight.height5(context: context),
        PriceTextsPackageTypeComponent(price: packageTypeList[index].price),
        SizedBoxHeight.height5(context: context),
        CustomImageWithTwoTextsLeftSide(
          firstText: 'Size:',
          secondText:
              '${packageTypeList[index].width}x${packageTypeList[index].height} cm',
          svgOrPngImage: 'png',
        ),
        SizedBoxHeight.height5(context: context),
        CustomTextExplainAboutPackageType(
          description: packageTypeList[index].description,
        ),
      ],
    );
  }
}
