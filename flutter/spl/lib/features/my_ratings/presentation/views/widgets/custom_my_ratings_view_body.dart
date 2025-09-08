import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/components/back_arrow_with_text_component.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/features/my_ratings/presentation/views/widgets/custom_app_bar_my_ratings.dart';
import 'package:spl/features/my_ratings/presentation/views/widgets/custom_sliver_list_my_rating_card.dart';

class CustomMyRatingsViewBody extends StatefulWidget {
  const CustomMyRatingsViewBody({super.key});

  @override
  State<CustomMyRatingsViewBody> createState() =>
      _CustomMyRatingsViewBodyState();
}

class _CustomMyRatingsViewBodyState extends State<CustomMyRatingsViewBody> {
  bool? isSelected = false;
  Future<void> getOnBoolValueFromSharedPreferences() async {
    isSelected =
        await BoolSharedPreferencesClass.getBoolParameterSharedPreferences(
          keyBool: kStringKeyFlutterSwitchInSharedPreferences,
        );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    getOnBoolValueFromSharedPreferences();
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(child: SizedBoxHeight.height32(context: context)),
        SliverToBoxAdapter(
          child: BackArrowWithTextComponent(
            text: isSelected == true ? 'تقييماتي' : 'My Ratings',
          ),
        ),
        const SliverToBoxAdapter(child: CustomTwoTextsMyRatings()),
        SliverToBoxAdapter(child: SizedBoxHeight.height19(context: context)),
        const CustomSliverListMyRatingCard(),
      ],
    );
  }
}
