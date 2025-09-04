import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spl/core/utils/components/text_bold_16_component.dart';
import 'package:spl/core/utils/components/text_normal_12_component.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/features/service_center_details/presentation/views/widgets/cusotm_line_like_underscore.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomOpenDayAndTimeDetailsSection extends StatelessWidget {
  const CustomOpenDayAndTimeDetailsSection({
    super.key,
    required this.dayText,
    required this.time,
    required this.color,
  });
  final String dayText;
  final String time;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            Assets.images.whiteCheckImage.path,
            colorFilter: ColorFilter.mode(
              time == 'Closed'
                  ? StyleToColors.littleGreyLevel1Color
                  : StyleToColors.littleNeonGreenColor,
              BlendMode.srcIn,
            ),
          ),
          Center(child: TextBold16Component(text: dayText)),
          const Center(child: CusotmLineLikeUnderscore()),
          TextNormal12Component(text: time, color: color),
        ],
      ),
    );
  }
}
