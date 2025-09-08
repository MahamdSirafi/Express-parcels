import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/helpers/push_go_router_helper.dart';
import 'package:spl/features/home/presentation/views/widgets/custom_image_text_button_section.dart';
import 'package:spl/features/home/presentation/views/widgets/custom_many_of_service_center_cards.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomHomeMiddleSection extends StatefulWidget {
  const CustomHomeMiddleSection({super.key});

  @override
  State<CustomHomeMiddleSection> createState() =>
      _CustomHomeMiddleSectionState();
}

class _CustomHomeMiddleSectionState extends State<CustomHomeMiddleSection> {
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
      children: [
        CustomImageTextButtonSection(
          image: Assets.images.locationBlackImageP.image(),
          text: isSelected == true ? 'مراكز الخدمات' : 'Services Centers',
          onPressed:
              () => pushGoRouterHelper(
                context: context,
                view: kServiceCenterViewRouter,
              ),
        ),
        const CustomManyOfServiceCenterCards(),
      ],
    );
  }
}
