import 'package:localfix/features/home/domain/entities/location_entity.dart';

class ProviderEntity {
  final String providerUid;
  final String name;
  final List<String> categoryId;
  final String? imageUrl;
  final String? bio;
  final int experienceYears;
  final double distance;
  final double rating;
  final int reviewCount;
  final LocationEntity? location;
  final bool isVerified;
  final bool isAvailable;
  const ProviderEntity({
    required this.providerUid,
    required this.name,
    required this.categoryId,
    required this.imageUrl,
    required this.bio,
    required this.experienceYears,
    required this.distance,
    required this.rating,
    required this.reviewCount,
    required this.location,
    required this.isVerified,
    required this.isAvailable
  });
}
