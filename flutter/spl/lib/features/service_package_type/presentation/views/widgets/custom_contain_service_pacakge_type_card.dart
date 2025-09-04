import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/price_texts_package_type_component.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/features/service_package_type/presentation/managers/models/service_package_type_model.dart';
import 'package:spl/features/service_package_type/presentation/views/widgets/custom_header_service_package_type_card.dart';
import 'package:spl/features/service_package_type/presentation/views/widgets/custom_image_and_two_texts_service_package_card.dart';

class CustomContainServicePacakgeTypeCard extends StatelessWidget {
  const CustomContainServicePacakgeTypeCard({
    super.key,
    required this.servicePackageTypeList,
    required this.index,
  });
  final List<ServicePackageTypeModel> servicePackageTypeList;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomHeaderServicePackageTypeCard(
          text: servicePackageTypeList[index].name,
        ),
        PriceTextsPackageTypeComponent(
          price: servicePackageTypeList[index].price,
        ),
        SizedBoxHeight.height10(context: context),
        CustomImageAndTwoTextsServicePackageCard(
          text: servicePackageTypeList[index].description,
        ),
      ],
    );
  }
}
