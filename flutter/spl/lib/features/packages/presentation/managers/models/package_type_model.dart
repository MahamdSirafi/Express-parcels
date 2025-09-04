class PackageTypeModel {
  final String name;
  final String description;
  final int price;
  final int width;
  final int height;
  final String createdAt;
  PackageTypeModel({
    required this.name,
    required this.description,
    required this.price,
    required this.width,
    required this.height,
    required this.createdAt,
  });
  factory PackageTypeModel.fromJson({
    required Map<String, dynamic> packageTypeJson,
  }) {
    return PackageTypeModel(
      name: packageTypeJson['name'],
      description: packageTypeJson['description'],
      price: packageTypeJson['price'],
      width: packageTypeJson['width'],
      height: packageTypeJson['hight'],
      createdAt: packageTypeJson['createdAt'],
    );
  }
}
