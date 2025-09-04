import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';
import 'package:spl/features/service_centers/presentation/managers/cubits/service_centers_cubit/service_centers_cubit.dart';
import 'package:spl/features/service_centers/presentation/managers/cubits/service_centers_cubit/service_centers_state.dart';
import 'package:spl/features/service_centers/presentation/views/widgets/custom_service_center_card_with_some_details.dart';

class CustomSliverListServiceCenterCardWithSomeDetails extends StatelessWidget {
  const CustomSliverListServiceCenterCardWithSomeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return BlocBuilder<ServiceCentersCubit, ServiceCentersState>(
      builder: (context, state) {
        if (state is ServiceCentersSuccessState) {
          if (state.listOfServiceCentersInCubit.isEmpty) {
            return SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.037),
                child: Center(
                  child: Text(
                    'No service centers available',
                    style: StyleToTexts.textStyleNormal14(context: context),
                    // Check if list(that contain on services from api) is empty
                  ),
                ),
              ),
            );
          }
          return SliverList.builder(
            itemCount: state.listOfServiceCentersInCubit.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * 0.021),
                child: CustomServiceCenterCardWithSomeDetails(
                  listOfServiceCenters: state.listOfServiceCentersInCubit,
                  index: index,
                ),
              );
            },
          );
        } else if (state is ServiceCentersFailureState) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.037),
              child: Center(
                child: Text(
                  state.errorMessageInCubit,
                  style: StyleToTexts.textStyleNormal14(context: context),
                ),
              ),
            ),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
