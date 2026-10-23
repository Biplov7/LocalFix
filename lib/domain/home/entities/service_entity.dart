class ServiceEntity {
  final String serviceId;
  final String categoryId;
  final String name;
  final String description;
  final String? imageUrl;
  final bool isActive;

  const ServiceEntity({
    required this.serviceId,
    required this.categoryId,
    required this.name,
    required this.description,
    this.imageUrl,
    required this.isActive,
  });
}
