import 'package:flutter/material.dart';
import 'package:spl/features/packages/presentation/views/widgets/custom_app_bar_with_sized_box_package_type_section.dart';
import 'package:spl/features/packages/presentation/views/widgets/custom_sliver_list_package_type.dart';

class CustomPackagesTypeViewBody extends StatelessWidget {
  const CustomPackagesTypeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        CustomAppBarWithSizedBoxPackageTypeSection(),
        CustomSliverListPackageType(),
      ],
    );
  }
}
