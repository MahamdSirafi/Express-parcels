import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/card_contain_on_text_component.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/features/service_center_details/presentation/views/widgets/custom_contain_widget_that_inside_card_in_bottom_navigation_bar.dart';

class CustomBottomNavigationBarServiceCenterDetails extends StatelessWidget {
  const CustomBottomNavigationBarServiceCenterDetails({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.037),
      child: CardContainOnTextComponent(
        onTap: () {},
        color: StyleToColors.whiteColor,
        side: StyleToColors.mediumSkyBlueColor,
        isNeedToWidget: true,
        widget: const CustomContainWidgetThatInsideCardInBottomNavigationBar(),
      ),
    );
  }
}
