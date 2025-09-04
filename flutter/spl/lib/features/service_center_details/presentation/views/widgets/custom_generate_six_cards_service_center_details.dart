import 'package:flutter/material.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';
import 'package:spl/features/service_center_details/presentation/managers/models/service_center_details_model.dart';

class CustomGenerateSixCardsServiceCenterDetails extends StatelessWidget {
  const CustomGenerateSixCardsServiceCenterDetails({
    super.key,
    required this.serviceCenterDetailsModel,
  });
  final ServiceCenterDetailsModel serviceCenterDetailsModel;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.only(left: size.width * 0.074),
      child: Wrap(
        //Wrap: like Row(put Widgets horizontal but you don't need to use SingleChildScrollView becuase Wrap can do this job when the widget you can't put it next to widget(this widget before it) so it's will make the widget go to new line)
        spacing: size.width * 0.037,
        runSpacing: size.height * 0.014,
        children: List.generate(
          serviceCenterDetailsModel.serviceOffered.length,
          (index) {
            final texts = serviceCenterDetailsModel.serviceOffered[index];
            return Container(
              height: size.height * 0.028,
              width: size.width * 0.168,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: StyleToColors.littleGreyLevel1Color,
                borderRadius: BorderRadius.circular(size.height * 0.007),
              ),
              child: Text(
                texts,
                style: StyleToTexts.textStyleNormal6(context: context),
              ),
            );
          },
        ),
      ),
    );
  }
}
