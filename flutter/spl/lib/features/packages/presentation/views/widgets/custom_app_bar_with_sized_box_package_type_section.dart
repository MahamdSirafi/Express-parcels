import 'package:flutter/material.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/features/packages/presentation/views/widgets/custom_app_bar_package_types_view.dart';

class CustomAppBarWithSizedBoxPackageTypeSection extends StatelessWidget {
  const CustomAppBarWithSizedBoxPackageTypeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          SizedBoxHeight.height23(context: context),
          const CustomAppBarPackageTypesView(),
          SizedBoxHeight.height15(context: context),
        ],
      ),
    );
  }
}
