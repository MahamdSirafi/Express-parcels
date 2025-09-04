import 'package:flutter/material.dart';
import 'package:spl/features/my_ratings/presentation/views/widgets/custom_my_rating_card.dart';

class CustomSliverListMyRatingCard extends StatelessWidget {
  const CustomSliverListMyRatingCard({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return SliverList.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: height * 0.015),
          child: const CustomMyRatingCard(),
        );
      },
    );
  }
}
