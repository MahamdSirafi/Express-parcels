import 'package:flutter/material.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_width.dart';
import 'package:spl/features/home/presentation/views/widgets/custom_image_with_text.dart';
import 'package:spl/features/home/presentation/views/widgets/custom_text_button_see_all.dart';

class CustomImageTextButtonSection extends StatelessWidget {
  const CustomImageTextButtonSection({
    super.key,
    required this.text,
    required this.image,
    required this.onPressed,
  });
  final String text;
  final Image image;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.only(
        left: size.width * 0.047,
        right: size.width * 0.024,
      ),
      child: Row(
        children: [
          CustomImageWithText(image: image, text: text),
          SizedBoxWidth.widthExpanded,
          CustomTextButtonSeeAll(onPressed: onPressed),
        ],
      ),
    );
  }
}
