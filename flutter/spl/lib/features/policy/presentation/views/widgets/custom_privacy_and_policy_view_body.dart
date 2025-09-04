import 'package:flutter/material.dart';
import 'package:spl/core/utils/lists/texts_in_cross_fade_card_privacy_information_safe_list.dart';
import 'package:spl/core/utils/lists/texts_in_cross_fade_card_privacy_location_service_list.dart';
import 'package:spl/core/utils/lists/texts_in_cross_fade_card_privacy_terms_and_conditions_list.dart';
import 'package:spl/core/utils/lists/title_texts_in_list_tile_privacy_list.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/components/card_and_cross_fade_card_component.dart';
import 'package:spl/features/policy/presentation/views/widgets/custom_app_bar_privacy_policy.dart';

class CustomPrivacyAndPolicyViewBody extends StatelessWidget {
  const CustomPrivacyAndPolicyViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBoxHeight.height33(context: context),
          const CustomAppBarPrivacyPolicy(),
          SizedBoxHeight.height21(context: context),
          CardAndCrossFadeCardComponent(
            colorToCard: StyleToColors.whiteColor,
            percentToBorderRadius: 0.016,
            textsInCrossFadeFirstCard:
                textsInCrossFadeCardPrivacyInformationSafeList,
            textsInCrossFadeSecondCard:
                textsInCrossFadeCardPrivacyTermsAndConditionsList,
            textsInCrossFadeThirdCard:
                textsInCrossFadeCardPrivacyLocationServiceList,
            titleTextsInListTile: titleTextsInListTilePrivacyList,
          ),
          SizedBoxHeight.height10(context: context),
        ],
      ),
    );
  }
}
