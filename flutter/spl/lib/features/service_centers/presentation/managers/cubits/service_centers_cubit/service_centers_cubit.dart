import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spl/features/service_centers/data/repositories/service_centers_repository_implmentation.dart';
import 'package:spl/features/service_centers/presentation/managers/cubits/service_centers_cubit/service_centers_state.dart';
import 'package:spl/features/service_centers/presentation/managers/models/service_centers_model.dart';

class ServiceCentersCubit extends Cubit<ServiceCentersState> {
  ServiceCentersCubit({required this.serviceCentersRepositoryImplmentation})
    : super(ServiceCentersInitialState());
  final ServiceCentersRepositoryImplmentation
  serviceCentersRepositoryImplmentation;
  List<ServiceCentersModel> filterCitiesList = [];
  //in ServiceCentersView i have TextField and should when the user use this TextField to search on service centers cards(from city) must be appear just this service centers that related in this city
  //so i will store this service centers that related in cityName that user searched on it so i will store them in this List
  Future<void> getMethodServiceCentersCubit() async {
    emit(ServiceCentersLoadingState());
    final result =
        await serviceCentersRepositoryImplmentation.getServiceCenters();
    result.fold(
      (failure) => emit(
        ServiceCentersFailureState(
          errorMessageInCubit: failure.errorMessageInFailuresClass,
        ),
      ),
      (serviceCenters) => emit(
        ServiceCentersSuccessState(listOfServiceCentersInCubit: serviceCenters),
      ),
    );
  }

  void filterCitiesServiceCenters({required String cityName}) {
    if (state is ServiceCentersSuccessState) {
      final successState = state as ServiceCentersSuccessState;
      //i assign SuccessState to enable from get on parameter in SuccessState that contain service centers card and i want change value it when the user start write in TextField
      filterCitiesList =
          successState.listOfServiceCentersInCubit
              .where(
                (successCenters) => successCenters.city.toLowerCase().contains(
                  cityName.toLowerCase(),
                ),
              )
              .toList();
      //.where(it's like loop and it's check(if city parameter same value cityName parameter(that user input it when use the TextField)) and return(so return this service centers card if the condition is true))
      //make all values(city and cityName) are toLowerCase in this condition to ensure doesn't happen any wrong because Aleppo(in city) and aleppo(in cityName)
      emit(
        ServiceCentersSuccessState(
          listOfServiceCentersInCubit: filterCitiesList,
        ),
      );
    }
  }
}
