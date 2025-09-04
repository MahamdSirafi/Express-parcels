class OperatingHoursModel {
  final String start;
  final String end;
  final String day;
  OperatingHoursModel({
    required this.start,
    required this.end,
    required this.day,
  });
  factory OperatingHoursModel.fromJson({
    required Map<String, dynamic> operatingHoursJson,
  }) {
    return OperatingHoursModel(
      start: operatingHoursJson['start'] ?? '',
      end: operatingHoursJson['end'] ?? '',
      day: operatingHoursJson['day'] ?? '',
    );
  }
}
