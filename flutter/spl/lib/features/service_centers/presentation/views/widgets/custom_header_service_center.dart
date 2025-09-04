import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/view_details_text_button_component.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/helpers/push_go_router_helper.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_width.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';
import 'package:spl/features/service_centers/presentation/managers/models/service_centers_model.dart';

class CustomHeaderServiceCenter extends StatelessWidget {
  const CustomHeaderServiceCenter({
    super.key,
    required this.listOfServiceCenters,
    required this.index,
  });
  final List<ServiceCentersModel> listOfServiceCenters;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          listOfServiceCenters[index].name,
          style: StyleToTexts.textStyleMedium18(context: context),
        ),
        SizedBoxWidth.widthExpanded,
        ViewDetailsTextButtonComponent(
          onPressed: () {
            pushGoRouterHelper(
              context: context,
              view: kServiceCenterDetailsViewRouter,
              extra: index,
            );
          },
        ),
      ],
    );
  }
}
