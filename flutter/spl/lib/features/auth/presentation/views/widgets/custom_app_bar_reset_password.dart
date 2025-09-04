import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/back_arrow_image_component.dart';
import 'package:spl/core/utils/components/left_padding_component.dart';

class CustomAppBarResetPassword extends StatelessWidget {
  const CustomAppBarResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return const LeftPaddingComponent(
      leftPercent: 0.035,
      child: BackArrowImageComponent(),
    );
  }
}
