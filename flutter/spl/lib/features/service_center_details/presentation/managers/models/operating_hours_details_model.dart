class OperatingHoursDetailsModel {
  final String start;
  final String end;
  final String day;
  OperatingHoursDetailsModel({
    required this.start,
    required this.end,
    required this.day,
  });
  factory OperatingHoursDetailsModel.fromJson({
    required Map<String, dynamic> operatingHoursJson,
  }) {
    return OperatingHoursDetailsModel(
      start: operatingHoursJson['start'] ?? '',
      end: operatingHoursJson['end'] ?? '',
      day: operatingHoursJson['day'] ?? '',
    );
  }
}
