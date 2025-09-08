import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/components/text_bold_20_component.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/features/splash/presentation/views/widgets/custom_truck_and_background_image.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomImagesAndTextsSection extends StatefulWidget {
  const CustomImagesAndTextsSection({super.key});

  @override
  State<CustomImagesAndTextsSection> createState() =>
      _CustomImagesAndTextsSectionState();
}

class _CustomImagesAndTextsSectionState
    extends State<CustomImagesAndTextsSection> {
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
    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomTruckAndBackgroundImage(),
          TextBold20Component(
            text: isSelected == true ? 'مرحباً بكم في' : 'Welcome to',
            color: StyleToColors.greyColor,
          ),
          Assets.images.expressSyriaImage.image(
            height: 150,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          TextBold20Component(
            text:
                isSelected == true
                    ? 'تتبع شحنتك خطوة بخطوة'
                    : 'track your shipment step by step',
            color: StyleToColors.greyColor,
          ),
        ],
      ),
    );
  }
}
