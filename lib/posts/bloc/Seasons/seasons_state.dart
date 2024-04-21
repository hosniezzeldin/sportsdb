part of 'seasons_bloc.dart';

enum SeasonStatus { initial, success, failure }

final class SeasonState extends Equatable {
  const SeasonState({
    this.status = SeasonStatus.initial,
    this.seasons = const <Season>[],
    this.hasReachedMax = false,
  });

  final SeasonStatus status;
  final List<Season> seasons;
  final bool hasReachedMax;

  SeasonState copyWith({
    SeasonStatus? status,
    List<Season>? seasons,
    bool? hasReachedMax,
  }) {
    return SeasonState(
      status: status ?? this.status,
      seasons: seasons ?? this.seasons,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''PostState { status: $status, hasReachedMax: $hasReachedMax, posts: ${seasons.length} }''';
  }

  @override
  List<Object> get props => [status, seasons, hasReachedMax];
}
