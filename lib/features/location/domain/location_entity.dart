class LocationEntity {
  final double latitude;
  final double longitude;
  final String? country;
  final String? province;
  final String? district;
  final String? city;
  final String? address;

  const LocationEntity({
    required this.latitude,
    required this.longitude,
    this.country = 'Nepal',
    this.province,
    this.district,
    this.city,
    this.address,
  });
}