import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/back_arrow_with_text_component.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/features/my_ratings/presentation/views/widgets/custom_app_bar_my_ratings.dart';
import 'package:spl/features/my_ratings/presentation/views/widgets/custom_sliver_list_my_rating_card.dart';

class CustomMyRatingsViewBody extends StatelessWidget {
  const CustomMyRatingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(child: SizedBoxHeight.height32(context: context)),
        const SliverToBoxAdapter(
          child: BackArrowWithTextComponent(text: 'My Ratings'),
        ),
        const SliverToBoxAdapter(child: CustomTwoTextsMyRatings()),
        SliverToBoxAdapter(child: SizedBoxHeight.height19(context: context)),
        const CustomSliverListMyRatingCard(),
      ],
    );
  }
}
