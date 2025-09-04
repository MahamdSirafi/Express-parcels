import 'package:spl/features/service_centers/presentation/managers/models/operating_hours_model.dart';

class ServiceCentersModel {
  final String zip;
  final String city;
  final String street;
  final String specialInstructions;
  final String phone;
  final String name;
  final List<dynamic> serviceOffered;
  final List<OperatingHoursModel> operatingHoursModel;
  ServiceCentersModel({
    required this.city,
    required this.street,
    required this.specialInstructions,
    required this.zip,
    required this.phone,
    required this.name,
    required this.serviceOffered,
    required this.operatingHoursModel,
  });
  factory ServiceCentersModel.fromJson({
    required Map<String, dynamic> serviceCentersJson,
  }) {
    final address = serviceCentersJson['address'] ?? {};
    final operatingHour =
        (serviceCentersJson['operating_hours'] as List?) ?? [];
    //you must put as List? to make the .map work because .map work with List and when you don't determined so Dart will put the data type it is dynamic
    return ServiceCentersModel(
      city: address['city'] ?? '',
      street: address['street'] ?? '',
      specialInstructions: serviceCentersJson['special_instructions'] ?? '',
      zip: address['zip'] ?? '',
      phone: serviceCentersJson['phone'] ?? '',
      name: serviceCentersJson['name'] ?? '',
      serviceOffered: serviceCentersJson['services_offered'] ?? [],
      operatingHoursModel:
          operatingHour.map((item) {
            return OperatingHoursModel.fromJson(operatingHoursJson: item);
          }).toList(),
    );
  }
}
