import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/components/text_bold_20_component.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/features/my_ratings/presentation/views/widgets/custom_another_texts_and_image_in_rating_card.dart';

class CustomTextsAndImageHeaderInRatingCard extends StatefulWidget {
  const CustomTextsAndImageHeaderInRatingCard({super.key});

  @override
  State<CustomTextsAndImageHeaderInRatingCard> createState() =>
      _CustomTextsAndImageHeaderInRatingCardState();
}

class _CustomTextsAndImageHeaderInRatingCardState
    extends State<CustomTextsAndImageHeaderInRatingCard> {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextBold20Component(
          text: isSelected == true ? 'طرد الهوية' : 'ID Parcel',
        ),
        SizedBoxHeight.height5(context: context),
        const CustomAnotherTextsAndImageInRatingCard(),
      ],
    );
  }
}
