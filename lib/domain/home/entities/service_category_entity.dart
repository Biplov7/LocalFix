class ServiceCategoryEntity {
  final String categoryId;
  final String name;
  final String? icon;
  final String description;
  final String? imageUrl;
  final bool isActive;
  final int sortOrder;

  ServiceCategoryEntity({
    required this.categoryId,
    required this.name,
    required this.icon,
    required this.description,
    this.imageUrl,
    required this.isActive,
    required this.sortOrder,
  });
}
