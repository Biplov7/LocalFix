import 'package:localfix/features/home/domain/entities/service_category_entity.dart';

class ServiceCategoryModel extends ServiceCategoryEntity {
  ServiceCategoryModel({
    required super.categoryId,
    required super.name,
    required super.icon,
    required super.description,
    required super.isActive,
    required super.sortOrder,
  });

  // Convert Map to ServiceCategoryModel
  factory ServiceCategoryModel.fromMap(Map<String, dynamic> map) {
    return ServiceCategoryModel(
      categoryId: map['categoryId'] as String,
      name: map['name'] as String,
      icon: map['icon'] as String,
      description: map['description'] as String,
      isActive: map['isActive'] as bool,
      sortOrder: map['sortOrder'] as int,
    );
  }

  // Convert ServiceCategoryModel to Map
  Map<String, dynamic> toMap() {
    return {
      'categoryId': categoryId,
      'name': name,
      'icon': icon,
      'description': description,
      'isActive': isActive,
      'sortOrder': sortOrder,
    };
  }
}
