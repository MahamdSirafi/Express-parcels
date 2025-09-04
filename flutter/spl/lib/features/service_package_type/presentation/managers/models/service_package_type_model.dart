class ServicePackageTypeModel {
  final int price;
  final String description;
  final String name;
  ServicePackageTypeModel({
    required this.price,
    required this.description,
    required this.name,
  });
  factory ServicePackageTypeModel.fromJson({
    required Map<String, dynamic> servicePackageType,
  }) {
    return ServicePackageTypeModel(
      price: servicePackageType['price'],
      description: servicePackageType['description'],
      name: servicePackageType['name'],
    );
  }
}
