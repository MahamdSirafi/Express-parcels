import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/helpers/push_go_router_helper.dart';
import 'package:spl/features/home/presentation/views/widgets/custom_generate_parcel_type.dart';
import 'package:spl/features/home/presentation/views/widgets/custom_image_text_button_section.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomHomeBottomSection extends StatefulWidget {
  const CustomHomeBottomSection({super.key});

  @override
  State<CustomHomeBottomSection> createState() =>
      _CustomHomeBottomSectionState();
}

class _CustomHomeBottomSectionState extends State<CustomHomeBottomSection> {
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
          image: Assets.images.quickOrderImage.image(),
          text: isSelected == true ? 'نوع الطرد' : 'Parcel Type',
          onPressed:
              () => pushGoRouterHelper(
                context: context,
                view: kPackagesTypeViewRouter,
              ),
        ),
        const CustomGenerateParcelType(),
      ],
    );
  }
}
