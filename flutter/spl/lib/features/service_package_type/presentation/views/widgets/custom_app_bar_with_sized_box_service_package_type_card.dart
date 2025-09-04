import 'package:flutter/material.dart';
import 'package:spl/core/utils/components/back_with_two_texts_component.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';

class CustomAppBarWithSizedBoxServicePackageTypeCard extends StatelessWidget {
  const CustomAppBarWithSizedBoxServicePackageTypeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          SizedBoxHeight.height23(context: context),
          const BackArrowWithTwoTextsComponent(
            firstText: 'Types of shipping',
            secondText: 'services available',
          ),
          SizedBoxHeight.height30(context: context),
        ],
      ),
    );
  }
}
