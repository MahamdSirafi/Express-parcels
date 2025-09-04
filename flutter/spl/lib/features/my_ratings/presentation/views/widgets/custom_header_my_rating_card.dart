import 'package:flutter/material.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_width.dart';
import 'package:spl/features/my_ratings/presentation/views/widgets/custom_edit_image_in_my_rating_card.dart';
import 'package:spl/features/my_ratings/presentation/views/widgets/custom_texts_and_image_header_in_rating_card.dart';

class CustomHeaderMyRatingCard extends StatelessWidget {
  const CustomHeaderMyRatingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CustomTextsAndImageHeaderInRatingCard(),
        SizedBoxWidth.widthExpanded,
        CustomEditImageInMyRatingCard(),
      ],
    );
  }
}
