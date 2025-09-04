import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spl/core/utils/components/back_arrow_with_text_component.dart';
import 'package:spl/core/utils/sizes/sized_box/sized_box_height.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';
import 'package:spl/features/service_center_details/presentation/managers/cubits/service_center_details_cubit/service_center_details_cubit.dart';
import 'package:spl/features/service_center_details/presentation/managers/cubits/service_center_details_cubit/service_center_details_state.dart';
import 'package:spl/features/service_center_details/presentation/views/widgets/custom_all_texts_service_center_details.dart';
import 'package:spl/features/service_center_details/presentation/views/widgets/custom_generate_six_cards_service_center_details.dart';
import 'package:spl/features/service_center_details/presentation/views/widgets/custom_opening_image_and_text_service_center_details.dart';
import 'package:spl/features/service_center_details/presentation/views/widgets/custom_opening_time_table.dart';
import 'package:spl/features/service_center_details/presentation/views/widgets/custom_service_image_and_text_service_center_details.dart';

class CustomServiceCenterDetailsViewBody extends StatelessWidget {
  const CustomServiceCenterDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return BlocBuilder<ServiceCenterDetailsCubit, ServiceCenterDetailsState>(
      builder: (context, state) {
        if (state is FailureServiceCenterDetailsState) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Center(child: Text(state.errorMessageInCubit)),
          );
        } else if (state is SuccessServiceCenterDetailsState) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBoxHeight.height23(context: context),
                BackArrowWithTextComponent(
                  text: state.listOfServiceCentersDetailsInCubit.name,
                ),
                SizedBoxHeight.height10(context: context),
                CustomAllTextsServiceCenterDetails(
                  serviceCenterDetailsModel:
                      state.listOfServiceCentersDetailsInCubit,
                ),
                SizedBoxHeight.height30(context: context),
                const CustomServiceImageAndTextServiceCenterDetails(),
                SizedBoxHeight.height15(context: context),
                CustomGenerateSixCardsServiceCenterDetails(
                  serviceCenterDetailsModel:
                      state.listOfServiceCentersDetailsInCubit,
                ),
                SizedBoxHeight.height30(context: context),
                const CustomOpeningImageAndTextServiceCenterDetails(),
                SizedBoxHeight.height20(context: context),
                CustomOpeningTimeTable(
                  serviceCenterDetailsModel:
                      state.listOfServiceCentersDetailsInCubit,
                ),
              ],
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
