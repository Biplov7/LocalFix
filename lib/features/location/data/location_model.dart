import 'package:localfix/features/location/domain/location_entity.dart';

class LocationModel extends LocationEntity {
  const LocationModel({
    super.country = 'Nepal',
    required super.latitude,
    required super.longitude,
    super.address,
    super.city,
    super.district,
  });

  factory LocationModel.fromMap(Map<String, dynamic> map) {
    return LocationModel(
      latitude: (map['latitude'] ?? 0).toDouble(),
      longitude: (map['longitude'] ?? 0).toDouble(),
      country: map['country'] ?? 'Nepal',
      address: map['address'] ?? '',
      city: map['city'] ?? '',
      district: map['district'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'country': country,
      'address': address,
      'city': city,
      'district': district,
    };
  }
}
