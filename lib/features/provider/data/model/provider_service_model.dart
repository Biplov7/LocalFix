
import 'package:localfix/features/provider/domain/entities/provider_service_entity.dart';

class ProviderServiceModel extends ProviderServiceEntity {
  const ProviderServiceModel({
    required super.id,
    required super.providerUid,
    required super.serviceId,
    required super.categoryId,
    super.customTitle,
    required super.description,
    required super.price,
    required super.imageUrl,
    required super.estimatedDurationMinutes,
    required super.isActive,
  });

  factory ProviderServiceModel.fromMap(Map<String, dynamic> map) {
    return ProviderServiceModel(
      id: map['id'] ?? '',
      providerUid: map['providerUid'] ?? '',
      serviceId: map['serviceId'] ?? '',
      categoryId: map['categoryId'] ?? '',
      customTitle: map['customTitle'],
      description: map['description'] ?? '',
      price: (map['price'] ?? 0).toDouble(),
      imageUrl: map['imageUrl'] ?? '',
      estimatedDurationMinutes:
          map['estimatedDurationMinutes'] ?? 0,
      isActive: map['isActive'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'providerUid': providerUid,
      'serviceId': serviceId,
      'categoryId': categoryId,
      'customTitle': customTitle,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'estimatedDurationMinutes': estimatedDurationMinutes,
      'isActive': isActive,
    };
  }
}
