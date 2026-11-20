import 'package:localfix/features/provider/domain/entities/provider_entity.dart';
import 'package:localfix/features/location/data/location_model.dart';

class ProviderModel extends ProviderEntity {
  const ProviderModel({
    required super.providerUid,
    required super.name,
    required super.categoryId,
    required super.imageUrl,
    required super.bio,
    required super.experienceYears,
    required super.distance,
    required super.rating,
    required super.reviewCount,
    required super.location,
    required super.isVerified,
    required super.isAvailable,
  });

  factory ProviderModel.fromMap(Map<String, dynamic> map) {
    final locationData = map['location'];

    return ProviderModel(
      providerUid: map['providerUid'] ?? '',
      name: map['name'] ?? '',
      categoryId: List<String>.from(map['categoryId'] ?? []),
      imageUrl: map['imageUrl'],
      bio: map['bio'],
      experienceYears: map['experienceYears'] ?? 0,
      distance: 0.0,
      rating: (map['rating'] ?? 0).toDouble(),
      reviewCount: map['reviewCount'] ?? 0,
      location: locationData == null
          ? null
          : LocationModel.fromMap(
              Map<String, dynamic>.from(locationData),
            ),
      isVerified: map['isVerified'] ?? false,
      isAvailable: map['isAvailable'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'providerUid': providerUid,
      'name': name,
      'categoryId': categoryId,
      'imageUrl': imageUrl,
      'bio': bio,
      'experienceYears': experienceYears,
      'rating': rating,
      'reviewCount': reviewCount,
      'location': location == null? null :(location as LocationModel).toMap(),
      'isVerified': isVerified,
      'isAvailable': isAvailable,
    };
  }
}
