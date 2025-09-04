import 'package:spl/features/service_center_details/presentation/managers/models/operating_hours_details_model.dart';

class ServiceCenterDetailsModel {
  final String zip;
  final String city;
  final String street;
  final String specialInstructions;
  final String phone;
  final String name;
  final List<dynamic> serviceOffered;
  final List<OperatingHoursDetailsModel> operatingHoursModel;
  ServiceCenterDetailsModel({
    required this.city,
    required this.street,
    required this.specialInstructions,
    required this.zip,
    required this.phone,
    required this.name,
    required this.serviceOffered,
    required this.operatingHoursModel,
  });
  factory ServiceCenterDetailsModel.fromJson({
    required Map<String, dynamic> serviceCentersJson,
  }) {
    final address = serviceCentersJson['address'] ?? {};
    final operatingHour =
        (serviceCentersJson['operating_hours'] as List?) ?? [];
    //you must put as List? to make the .map work because .map work with List and when you don't determined so Dart will put the data type it is dynamic
    return ServiceCenterDetailsModel(
      city: address['city'] ?? '',
      street: address['street'] ?? '',
      specialInstructions: serviceCentersJson['special_instructions'] ?? '',
      zip: address['zip'] ?? '',
      phone: serviceCentersJson['phone'] ?? '',
      name: serviceCentersJson['name'] ?? '',
      serviceOffered: serviceCentersJson['services_offered'] ?? [],
      operatingHoursModel:
          operatingHour.map((item) {
            return OperatingHoursDetailsModel.fromJson(
              operatingHoursJson: item,
            );
          }).toList(),
    );
  }
}
