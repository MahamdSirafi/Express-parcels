import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/components/text_normal_10_component.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomGetOnProductFromWhat extends StatefulWidget {
  const CustomGetOnProductFromWhat({super.key});

  @override
  State<CustomGetOnProductFromWhat> createState() =>
      _CustomGetOnProductFromWhatState();
}

class _CustomGetOnProductFromWhatState
    extends State<CustomGetOnProductFromWhat> {
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
    Size size = MediaQuery.sizeOf(context);
    getOnBoolValueFromSharedPreferences();
    return Column(
      children: [
        Transform.translate(
          offset: Offset(-size.width * 0.04, size.height * 0.005),
          child: TextNormal10Component(
            text: isSelected == true ? 'بواسطة شاحنة' : 'by Truck',
          ),
        ),
        Assets.images.truckShipmentImage.image(height: size.height * 0.08),
      ],
    );
  }
}
