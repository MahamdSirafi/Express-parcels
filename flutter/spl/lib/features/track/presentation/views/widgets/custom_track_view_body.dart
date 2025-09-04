import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/back_with_two_texts_component.dart';
import 'package:spl/core/utils/components/text_form_field_with_prefix_and_suffix_icons_and_hint_and_up_text_component.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/features/track/presentation/views/widgets/custom_all_images_in_up_timeline_tile.dart';
import 'package:spl/features/track/presentation/views/widgets/custom_live_tracking_and_google_map.dart';
import 'package:spl/features/track/presentation/views/widgets/custom_timeline_tile_and_text_in_below_it.dart';

class CustomTrackViewBody extends StatelessWidget {
  const CustomTrackViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBoxHeight.height23(context: context),
          const BackArrowWithTwoTextsComponent(
            firstText: 'Track',
            secondText: 'Your Shipment',
          ),
          SizedBoxHeight.height20(context: context),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.037),
            child:
                const TextFormFieldWithPrefixAndSuffixIconsAndHintAndUpTextComponent(
                  text: 'Enter the shipment number or QR code',
                  hintText: '.....',
                ),
          ),
          SizedBoxHeight.height20(context: context),
          const CustomAllImagesInUpTimelineTile(),
          SizedBoxHeight.height8(context: context),
          const CustomTimelineTileAndTextInBelowIt(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.045),
            child: ClipRRect(
              //it is necessary to wrap the GoogleMap in a ClipRRect(inside and outside) because if you want to apply rounded corners and actually clip the content of the map
              borderRadius: BorderRadius.circular(size.height * 0.033),
              child: SizedBoxHeight.height300(
                context: context,
                child: const CustomLiveTrackingAndGoogleMap(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
