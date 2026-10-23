import 'package:localfix/features/home/domain/entities/service_entity.dart';

class ServiceModel extends ServiceEntity {
  ServiceModel({
    required super.serviceId,
    required super.categoryId,
    required super.name,
    required super.description,
    required super.isActive,
  });

  // Convert a Map into a ServiceModel
  factory ServiceModel.fromMap(Map<String, dynamic> map) {
    return ServiceModel(
      serviceId: map['serviceId'] as String,
      categoryId: map['categoryId'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      isActive: map['isActive'] as bool,
    );
  }

  // Convert a ServiceModel into a Map
  Map<String, dynamic> toMap() {
    return {
      'serviceId': serviceId,
      'categoryId': categoryId,
      'name': name,
      'description': description,
      'isActive': isActive,
    };
  }
}