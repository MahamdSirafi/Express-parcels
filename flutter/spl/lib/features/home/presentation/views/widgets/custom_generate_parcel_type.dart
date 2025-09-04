import 'package:flutter/material.dart';
import 'package:spl/core/utils/lists/parcel_type_list.dart';
import 'package:spl/features/home/presentation/views/widgets/custom_image_and_text_parcel_type.dart';

class CustomGenerateParcelType extends StatelessWidget {
  const CustomGenerateParcelType({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(3, (index) {
        final item = parcelTypeList[index];
        return CustomImageAndTextParcelType(item: item);
      }),
    );
  }
}
