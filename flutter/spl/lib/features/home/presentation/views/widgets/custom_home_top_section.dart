import 'package:flutter/material.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:spl/features/home/presentation/views/widgets/custom_text_and_card_track_shipment_section.dart';

class CustomHomeTopSection extends StatelessWidget {
  const CustomHomeTopSection({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomHomeAppBar(scaffoldKey: scaffoldKey),
        SizedBoxHeight.height15(context: context),
        const CustomTextAndCardTrackShipmentSection(),
      ],
    );
  }
}
