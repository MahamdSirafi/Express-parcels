import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spl/core/utils/classes/local_database/bool_shared_preferences_class.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/lists/services_centers_colors_list.dart';
import 'package:spl/core/utils/styles/style_to_texts.dart';
import 'package:spl/features/home/presentation/views/widgets/custom_service_center_card.dart';
import 'package:spl/features/service_centers/presentation/managers/cubits/service_centers_cubit/service_centers_cubit.dart';
import 'package:spl/features/service_centers/presentation/managers/cubits/service_centers_cubit/service_centers_state.dart';

class CustomManyOfServiceCenterCards extends StatefulWidget {
  const CustomManyOfServiceCenterCards({super.key});

  @override
  State<CustomManyOfServiceCenterCards> createState() =>
      _CustomManyOfServiceCenterCardsState();
}

class _CustomManyOfServiceCenterCardsState
    extends State<CustomManyOfServiceCenterCards> {
  bool? isSelected = false;
  Future<void> getOnBoolValueFromSharedPreferences() async {
    isSelected =
        await BoolSharedPreferencesClass.getBoolParameterSharedPreferences(
          keyBool: kStringKeyFlutterSwitchInSharedPreferences,
        );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    getOnBoolValueFromSharedPreferences();
    return BlocBuilder<ServiceCentersCubit, ServiceCentersState>(
      builder: (context, state) {
        if (state is ServiceCentersSuccessState) {
          if (state.listOfServiceCentersInCubit.isEmpty) {
            return Center(
              child: Text(
                isSelected == true
                    ? 'لا يوجد مراكز خدمة متاحة'
                    : 'No service centers available',
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
