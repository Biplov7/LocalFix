enum SearchResultType { provider, cagetory, services }

class SearchResultEntity {
  final String id;
  final String titile;
  final String? subTitle;
  final String? imageUrl;
  final SearchResultType type;

  new({
    required this.id,
    required this.titile,
    required this.subTitle,
    required this.imageUrl,
    required this.type,
  });
}
