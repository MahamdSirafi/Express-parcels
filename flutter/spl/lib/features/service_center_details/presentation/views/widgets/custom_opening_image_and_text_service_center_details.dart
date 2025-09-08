import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/components/text_bold_16_component.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_width.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomOpeningImageAndTextServiceCenterDetails extends StatefulWidget {
  const CustomOpeningImageAndTextServiceCenterDetails({super.key});

  @override
  State<CustomOpeningImageAndTextServiceCenterDetails> createState() =>
      _CustomOpeningImageAndTextServiceCenterDetailsState();
}

class _CustomOpeningImageAndTextServiceCenterDetailsState
    extends State<CustomOpeningImageAndTextServiceCenterDetails> {
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
    double width = MediaQuery.sizeOf(context).width;
    getOnBoolValueFromSharedPreferences();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.037),
      child: Row(
        children: [
          Assets.images.blueWatchImage.image(),
          SizedBoxWidth.width15(context: context),
          const TextBold16Component(text: 'Operating Hours'),
        ],
      ),
    );
  }
}
