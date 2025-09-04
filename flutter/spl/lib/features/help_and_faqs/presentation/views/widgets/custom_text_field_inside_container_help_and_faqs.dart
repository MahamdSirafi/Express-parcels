import 'package:flutter/material.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/features/help_and_faqs/presentation/views/widgets/custom_text_field_help_and_faqs.dart';

class CustomTextFieldInsideContainerHelpAndFaqs extends StatelessWidget {
  const CustomTextFieldInsideContainerHelpAndFaqs({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.073),
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.037),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.height * 0.021),
        color: StyleToColors.whiteColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            offset: Offset(0, size.height * 0.01),
            color: StyleToColors.blackColor.withAlpha(25),
          ),
        ], //i use Container because i want shadow in TextField
      ),
      child: const CustomTextFieldHelpAndFaqs(),
    );
  }
}
