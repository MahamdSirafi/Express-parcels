import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spl/core/utils/lists/services_centers_colors_list.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';
import 'package:spl/features/home/presentation/views/widgets/custom_service_center_card.dart';
import 'package:spl/features/service_centers/presentation/managers/cubits/service_centers_cubit/service_centers_cubit.dart';
import 'package:spl/features/service_centers/presentation/managers/cubits/service_centers_cubit/service_centers_state.dart';

class CustomManyOfServiceCenterCards extends StatelessWidget {
  const CustomManyOfServiceCenterCards({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return BlocBuilder<ServiceCentersCubit, ServiceCentersState>(
      builder: (context, state) {
        if (state is ServiceCentersSuccessState) {
          if (state.listOfServiceCentersInCubit.isEmpty) {
            return Center(
              child: Text(
                'No service centers available',
                style: StyleToTexts.textStyleNormal14(context: context),
                // Check if list(that contain on services from api) is empty
              ),
            );
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(3, (index) {
              return CustomServiceCenterCard(
                city: state.listOfServiceCentersInCubit[index].name,
                street: state.listOfServiceCentersInCubit[index].street,
                color: servicesCentersColorsList[index],
              );
            }),
          );
        } else if (state is ServiceCentersFailureState) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.037),
            child: Center(
              child: Text(
                state.errorMessageInCubit,
                style: StyleToTexts.textStyleNormal14(context: context),
              ),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
