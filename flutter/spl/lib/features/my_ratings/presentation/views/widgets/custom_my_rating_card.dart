import 'package:flutter/material.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/features/my_ratings/presentation/views/widgets/custom_contain_my_rating_card.dart';

class CustomMyRatingCard extends StatelessWidget {
  const CustomMyRatingCard({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.085),
      padding: EdgeInsets.only(
        left: size.width * 0.06,
        top: size.height * 0.028,
        bottom: size.height * 0.028,
        right: size.width * 0.025,
      ),
      decoration: BoxDecoration(
        color: StyleToColors.whiteColor,
        borderRadius: BorderRadius.circular(size.height * 0.033),
        boxShadow: [
          BoxShadow(
            blurRadius: 52,
            offset: Offset(0, size.height * 0.028),
            color: StyleToColors.blackColor.withAlpha(50),
          ),
        ],
      ),
      child: const CustomContainMyRatingCard(),
    );
  }
}
