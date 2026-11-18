import 'package:equatable/equatable.dart';
import '../../domain/entities/service_category_entity.dart';
import '../../domain/entities/search_result_entity.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final String userName;
  final List<ServiceCategoryEntity> categories;
  final List<SearchResultEntity> searchResults;
  final bool isSearching;
  final String? searchError;

  const HomeLoaded({
    required this.userName,
    required this.categories,
    this.searchResults = const [],
    this.isSearching = false,
    this.searchError,
  });

  HomeLoaded copyWith({
    String? userName,
    List<ServiceCategoryEntity>? categories,
    List<SearchResultEntity>? searchResults,
    bool? isSearching,
    String? searchError,
    bool clearSearchError = false,
  }) {
    return HomeLoaded(
      userName: userName ?? this.userName,
      categories: categories ?? this.categories,
      searchResults: searchResults ?? this.searchResults,
      isSearching: isSearching ?? this.isSearching,
      searchError:
          clearSearchError ? null : searchError ?? this.searchError,
    );
  }

  @override
  List<Object?> get props => [
        userName,
        categories,
        searchResults,
        isSearching,
        searchError,
      ];
}

final class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object?> get props => [message];
}
