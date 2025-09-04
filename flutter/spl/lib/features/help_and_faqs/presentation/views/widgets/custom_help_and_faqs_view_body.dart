import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/back_arrow_with_text_component.dart';
import 'package:spl/core/utils/components/card_and_cross_fade_card_component.dart';
import 'package:spl/core/utils/lists/texts_in_cross_fade_card_help_about_us_list.dart';
import 'package:spl/core/utils/lists/texts_in_cross_fade_card_help_delivery_times_list.dart';
import 'package:spl/core/utils/lists/texts_in_cross_fade_card_help_payment_process_list.dart';
import 'package:spl/core/utils/lists/title_texts_in_list_tile_help_list.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';

class CustomHelpAndFaqsViewBody extends StatelessWidget {
  const CustomHelpAndFaqsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBoxHeight.height33(context: context),
          BackArrowWithTextComponent(
            text: 'Help & FAQ\'S',
            textStyle: StyleToTexts.textStyleBold20(
              context: context,
            ).copyWith(color: StyleToColors.blackColor),
          ),
          SizedBoxHeight.height20(context: context),
          CardAndCrossFadeCardComponent(
            colorToCard: StyleToColors.extraLittleSkyBlueColor,
            percentToBorderRadius: 0.035,
            textsInCrossFadeFirstCard: textsInCrossFadeCardHelpAboutUsList,
            textsInCrossFadeSecondCard:
                textsInCrossFadeCardHelpPaymentProcessList,
            textsInCrossFadeThirdCard:
                textsInCrossFadeCardHelpDeliveryTimesList,
            titleTextsInListTile: titleTextsInListTileHelpList,
          ),
        ],
      ),
    );
  }
}
