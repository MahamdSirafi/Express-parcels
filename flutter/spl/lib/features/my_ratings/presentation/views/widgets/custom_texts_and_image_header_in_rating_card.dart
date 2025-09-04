import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/text_bold_20_component.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/features/my_ratings/presentation/views/widgets/custom_another_texts_and_image_in_rating_card.dart';

class CustomTextsAndImageHeaderInRatingCard extends StatelessWidget {
  const CustomTextsAndImageHeaderInRatingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextBold20Component(text: 'ID Parcel'),
        SizedBoxHeight.height5(context: context),
        const CustomAnotherTextsAndImageInRatingCard(),
      ],
    );
  }
}
