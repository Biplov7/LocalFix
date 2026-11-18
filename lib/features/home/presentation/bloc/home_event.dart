sealed class HomeEvent{}

final class HomeStarted extends HomeEvent{}

final class SearchPressed extends HomeEvent{
    final String query;
    SearchPressed(this.query);
}

final class SearchCleared extends HomeEvent{}