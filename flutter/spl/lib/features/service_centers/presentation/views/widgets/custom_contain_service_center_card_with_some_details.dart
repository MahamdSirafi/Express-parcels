import 'package:flutter/material.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/features/service_centers/presentation/managers/models/service_centers_model.dart';
import 'package:spl/features/service_centers/presentation/views/widgets/custom_generate_four_cards_inside_service_center.dart';
import 'package:spl/features/service_centers/presentation/views/widgets/custom_header_service_center.dart';
import 'package:spl/features/service_centers/presentation/views/widgets/custom_image_and_text_service_center_and_details_service_center.dart';
import 'package:spl/features/service_centers/presentation/views/widgets/custom_wonder_image_and_text_service_center.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomContainServiceCenterCardWithSomeDetails extends StatelessWidget {
  const CustomContainServiceCenterCardWithSomeDetails({
    super.key,
    required this.listOfServiceCenters,
    required this.index,
  });
  final List<ServiceCentersModel> listOfServiceCenters;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomHeaderServiceCenter(
          listOfServiceCenters: listOfServiceCenters,
          index: index,
        ),
        CustomImageAndTextServiceCenterAndDetailsServiceCenter(
          image: Assets.images.locationWithCurrentPositionImage.image(),
          text: listOfServiceCenters[index].street,
        ),
        SizedBoxHeight.height5(context: context),
        CustomImageAndTextServiceCenterAndDetailsServiceCenter(
          image: Assets.images.oldTelephoneImage.image(),
          text: listOfServiceCenters[index].phone,
        ),
        SizedBoxHeight.height10(context: context),
        CustomGenerateFourCardsInsideServiceCenter(
          serviceOffered: listOfServiceCenters[index].serviceOffered,
        ),
        SizedBoxHeight.height10(context: context),
        CustomImageAndTextServiceCenterAndDetailsServiceCenter(
          image: Assets.images.blackWatchImage.image(),
          text:
              'Open ${listOfServiceCenters[index].operatingHoursModel[2].start} until ${listOfServiceCenters[index].operatingHoursModel[2].end} PM',
          //in details service center i interested in seven days but in service centers no problem appear anything, and focus element numbers docs list different on element numbers hours list
        ),
        SizedBoxHeight.height5(context: context),
        CustomWonderImageAndTextServiceCenter(
          text: listOfServiceCenters[index].specialInstructions,
        ),
      ],
    );
  }
}
