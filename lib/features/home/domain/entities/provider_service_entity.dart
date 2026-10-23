class ProviderServiceEntity {
  final String id;
  final String providerUid;
  final String serviceId;
  final String categoryId;
  final String? customTitle;
  final String description;
  final double price;
  final int estimatedDurationMinutes;
  final bool isActive;

  const ProviderServiceEntity({
    required this.id,
    required this.providerUid,
    required this.serviceId,
    required this.categoryId,
    this.customTitle,
    required this.description,
    required this.price,
    required this.estimatedDurationMinutes,
    required this.isActive,
  });
}
