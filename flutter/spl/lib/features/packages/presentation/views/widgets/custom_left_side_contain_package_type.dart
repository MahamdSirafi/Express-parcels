import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/helpers/change_string_to_date_time_type_helper.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/features/packages/presentation/managers/models/package_type_model.dart';
import 'package:spl/features/packages/presentation/views/widgets/custom_image_with_two_texts_left_side.dart';
import 'package:spl/features/packages/presentation/views/widgets/custom_size_package_left_side.dart';
import 'package:spl/features/packages/presentation/views/widgets/custom_text_explain_about_package_type.dart';
import 'package:spl/core/utils/components/price_texts_package_type_component.dart';

class CustomLeftSideContainPackageType extends StatefulWidget {
  const CustomLeftSideContainPackageType({
    super.key,
    required this.packageTypeList,
    required this.index,
  });
  final List<PackageTypeModel> packageTypeList;
  final int index;

  @override
  State<CustomLeftSideContainPackageType> createState() =>
      _CustomLeftSideContainPackageTypeState();
}

class _CustomLeftSideContainPackageTypeState
    extends State<CustomLeftSideContainPackageType> {
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
        SizedBoxHeight.height10(context: context),
        CustomSizePackageLeftSide(
          name: widget.packageTypeList[widget.index].name,
        ),
        SizedBoxHeight.height5(context: context),
        CustomImageWithTwoTextsLeftSide(
          firstText: isSelected == true ? 'تاريخ الإنشاء' : 'Creation date',
          secondText: changeStringToDateTimeTypeHelper(
            text: widget.packageTypeList[widget.index].createdAt,
          ),
          svgOrPngImage: 'svg',
        ),
        SizedBoxHeight.height5(context: context),
        PriceTextsPackageTypeComponent(
          price: widget.packageTypeList[widget.index].price,
        ),
        SizedBoxHeight.height5(context: context),
        CustomImageWithTwoTextsLeftSide(
          firstText: isSelected == true ? 'مقاس:' : 'Size:',
          secondText:
              '${widget.packageTypeList[widget.index].width}x${widget.packageTypeList[widget.index].height} cm',
          svgOrPngImage: 'png',
        ),
        SizedBoxHeight.height5(context: context),
        CustomTextExplainAboutPackageType(
          description: widget.packageTypeList[widget.index].description,
        ),
      ],
    );
  }
}
