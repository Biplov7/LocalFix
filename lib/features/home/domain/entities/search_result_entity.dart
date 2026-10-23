enum SearchResultType {
  category,
  service,
  provider,
}

class SearchResultEntity {
  final String id;
  final String title;
  final String subTitle;
  final String imageUrl;
  final SearchResultType type;

  const SearchResultEntity({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.imageUrl,
    required this.type,
  });
}