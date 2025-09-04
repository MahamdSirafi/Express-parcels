import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/text_bold_16_component.dart';
import 'package:spl/core/utils/components/text_normal_8_component.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/features/home/presentation/views/widgets/custom_surf_card.dart';

class CustomContainServiceCenterCard extends StatelessWidget {
  const CustomContainServiceCenterCard({
    super.key,
    required this.city,
    required this.street,
  });
  final String city, street;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextBold16Component(
          text: city,
          maxLines: 1,
          textOverflow: TextOverflow.ellipsis,
        ),
        SizedBoxHeight.height4(context: context),
        TextNormal8Component(
          text: street,
          maxLines: 2,
          textOverflow: TextOverflow.ellipsis,
        ),
        SizedBoxHeight.heightExpanded,
        const CustomSurfCard(),
      ],
    );
  }
}
