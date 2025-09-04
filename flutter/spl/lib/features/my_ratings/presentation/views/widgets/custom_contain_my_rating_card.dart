import 'package:flutter/material.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/features/my_ratings/presentation/views/widgets/custom_comment_texts_in_my_rating_card.dart';
import 'package:spl/features/my_ratings/presentation/views/widgets/custom_header_my_rating_card.dart';
import 'package:spl/features/my_ratings/presentation/views/widgets/custom_stars_my_rating_card.dart';
import 'package:spl/features/my_ratings/presentation/views/widgets/custom_text_card_in_my_rating_card.dart';

class CustomContainMyRatingCard extends StatelessWidget {
  const CustomContainMyRatingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const CustomHeaderMyRatingCard(),
        SizedBoxHeight.height10(context: context),
        const CustomStarsMyRatingCard(),
        SizedBoxHeight.height10(context: context),
        const CustomCommentTextsInMyRatingCard(),
        SizedBoxHeight.height10(context: context),
        const CustomTextCardInMyRatingCard(),
      ],
    );
  }
}
