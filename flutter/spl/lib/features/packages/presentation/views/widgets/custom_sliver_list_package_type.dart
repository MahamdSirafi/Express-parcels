import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spl/core/utils/components/text_normal_10_component.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/helpers/push_go_router_helper.dart';
import 'package:spl/features/packages/presentation/managers/cubits/package_type_cubit/package_type_cubit.dart';
import 'package:spl/features/packages/presentation/managers/cubits/package_type_cubit/package_type_state.dart';
import 'package:spl/features/packages/presentation/views/widgets/custom_card_package_type.dart';

class CustomSliverListPackageType extends StatelessWidget {
  const CustomSliverListPackageType({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return BlocBuilder<PackageTypeCubit, PackageTypeState>(
      builder: (context, state) {
        if (state is PackageTypeFailureState) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.037),
              child: Center(
                child: TextNormal10Component(text: state.errorMessageInCubit),
              ),
            ),
          );
        } else if (state is PackageTypeSuccessState) {
          return SliverList.builder(
            itemCount: state.packageTypeInCubit.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  pushGoRouterHelper(
                    context: context,
                    view: kServicePackageTypeViewRouter,
                  );
                },
                child: CustomCardPackageType(
                  packageTypeList: state.packageTypeInCubit,
                  index: index,
                ),
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
