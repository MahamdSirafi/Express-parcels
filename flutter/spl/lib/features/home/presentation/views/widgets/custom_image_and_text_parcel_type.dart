import 'package:flutter/material.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/features/home/presentation/views/widgets/custom_parcel_type_image.dart';
import 'package:spl/features/home/presentation/views/widgets/custom_parcel_type_text.dart';

class CustomImageAndTextParcelType extends StatelessWidget {
  const CustomImageAndTextParcelType({super.key, required this.item});
  final dynamic item;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomParcelTypeImage(image: item),
        SizedBoxHeight.height10(context: context),
        CustomParcelTypeText(text: item),
      ],
    );
  }
}
