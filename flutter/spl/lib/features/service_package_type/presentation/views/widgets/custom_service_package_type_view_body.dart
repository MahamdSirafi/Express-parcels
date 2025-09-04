import 'package:flutter/material.dart';
import 'package:spl/features/service_package_type/presentation/views/widgets/custom_app_bar_with_sized_box_service_package_type_card.dart';
import 'package:spl/features/service_package_type/presentation/views/widgets/custom_sliver_list_service_package_type.dart';

class CustomServicePackageTypeViewBody extends StatelessWidget {
  const CustomServicePackageTypeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        CustomAppBarWithSizedBoxServicePackageTypeCard(),
        CustomSliverListServicePackageType(),
      ],
    );
  }
}
