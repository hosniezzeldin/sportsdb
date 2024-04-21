part of 'team_bloc.dart';

enum TeamStatus { initial, success, failure }

final class TeamState extends Equatable {
  const TeamState({
    this.status = TeamStatus.initial,
    this.seasons = const <Season>[],
    this.hasReachedMax = false,
  });

  final TeamStatus status;
  final List<Season> seasons;
  final bool hasReachedMax;

  TeamState copyWith({
    TeamStatus? status,
    List<Season>? seasons,
    bool? hasReachedMax,
  }) {
    return TeamState(
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
