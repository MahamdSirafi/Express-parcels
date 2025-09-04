import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spl/core/utils/components/text_normal_10_component.dart';
import 'package:spl/features/service_package_type/presentation/managers/cubits/service_package_type_cubit/service_package_type_cubit.dart';
import 'package:spl/features/service_package_type/presentation/managers/cubits/service_package_type_cubit/service_package_type_state.dart';
import 'package:spl/features/service_package_type/presentation/views/widgets/custom_service_package_type_card.dart';

class CustomSliverListServicePackageType extends StatelessWidget {
  const CustomSliverListServicePackageType({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return BlocBuilder<ServicePackageTypeCubit, ServicePackageTypeState>(
      builder: (context, state) {
        if (state is ServicePackageTypeFailureState) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.037),
              child: Center(
                child: TextNormal10Component(text: state.errorMessageInCubit),
              ),
            ),
          );
        } else if (state is ServicePackageTypeSuccessState) {
          return SliverList.builder(
            itemCount: state.servicePackageTypeInCubit.length,
            itemBuilder: (context, index) {
              return CustomServicePackageTypeCard(
                servicePackageTypeList: state.servicePackageTypeInCubit,
                index: index,
              );
            },
          );
        } else {
          return SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
