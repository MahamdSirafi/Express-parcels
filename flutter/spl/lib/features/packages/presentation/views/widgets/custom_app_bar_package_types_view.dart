import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/back_arrow_image_component.dart';
import 'package:spl/core/utils/components/custom_text_bold_26.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';

class CustomAppBarPackageTypesView extends StatelessWidget {
  const CustomAppBarPackageTypesView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: width * 0.037),
          child: const BackArrowImageComponent(),
        ),
        SizedBoxHeight.height10(context: context),
        Padding(
          padding: EdgeInsets.only(left: width * 0.074),
          child: const TextBold26Component(text: 'Package Types'),
        ),
      ],
    );
  }
}
