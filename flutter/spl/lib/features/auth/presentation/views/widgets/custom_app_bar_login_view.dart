import 'package:flutter/material.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';
import 'package:spl/features/auth/presentation/views/widgets/custom_back_arrow_with_auth_text.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomAppBarLoginView extends StatelessWidget {
  const CustomAppBarLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Stack(
      children: [
        Assets.images.backgroundLoginImage.image(),
        Positioned(
          top: size.height * 0.04,
          left: size.width * 0.035,
          child: CustomBackArrowWithAuthText(
            imageColor: StyleToColors.whiteColor,
            textAuth: 'LOGIN',
            textStyle: StyleToTexts.textStyleBold23(context: context),
          ),
        ),
      ],
    );
  }
}
