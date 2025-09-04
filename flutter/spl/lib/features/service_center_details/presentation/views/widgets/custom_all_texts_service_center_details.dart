import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/text_bold_14_component.dart';
import 'package:spl/core/utils/components/text_normal_10_component.dart';
import 'package:spl/core/utils/components/text_normal_12_component.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_width.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/features/service_center_details/presentation/managers/models/service_center_details_model.dart';
import 'package:spl/features/service_centers/presentation/views/widgets/custom_image_and_text_service_center_and_details_service_center.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomAllTextsServiceCenterDetails extends StatelessWidget {
  const CustomAllTextsServiceCenterDetails({
    super.key,
    required this.serviceCenterDetailsModel,
  });
  final ServiceCenterDetailsModel serviceCenterDetailsModel;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.only(left: width * 0.074),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const TextBold14Component(
                text: 'City',
                color: StyleToColors.littleNeonGreenColor,
              ),
              SizedBoxWidth.width10(context: context),
              TextNormal12Component(
                text:
                    '${serviceCenterDetailsModel.city}, ZIP: ${serviceCenterDetailsModel.zip}',
                color: StyleToColors.blackColor,
              ),
            ],
          ),
          SizedBoxHeight.height5(context: context),
          CustomImageAndTextServiceCenterAndDetailsServiceCenter(
            image: Assets.images.locationWithCurrentPositionImage.image(),
            text: serviceCenterDetailsModel.street,
          ),
          SizedBoxHeight.height5(context: context),
          CustomImageAndTextServiceCenterAndDetailsServiceCenter(
            image: Assets.images.oldTelephoneImage.image(),
            text: serviceCenterDetailsModel.phone,
          ),
          SizedBoxHeight.height5(context: context),
          Padding(
            padding: EdgeInsets.only(right: width * 0.005),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextNormal10Component(
                  text: 'Special instructions',
                  textColor: StyleToColors.mediumRedColor,
                ),
                SizedBoxWidth.width5(context: context),
                Expanded(
                  child: TextNormal10Component(
                    text: serviceCenterDetailsModel.specialInstructions,
                    textColor: StyleToColors.blackColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
