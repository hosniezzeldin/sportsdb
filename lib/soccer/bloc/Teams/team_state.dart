part of 'team_bloc.dart';

enum TeamStatus { initial, success, failure }

final class TeamState extends Equatable {
  const TeamState({
    this.status = TeamStatus.initial,
    this.teams = const <Team>[],
    this.hasReachedMax = false,
  });

  final TeamStatus status;
  final List<Team> teams;
  final bool hasReachedMax;

  TeamState copyWith({
    TeamStatus? status,
    List<Team>? teams,
    bool? hasReachedMax,
  }) {
    return TeamState(
      status: status ?? this.status,
      teams: teams ?? this.teams,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''PostState { status: $status, hasReachedMax: $hasReachedMax, soccer: ${teams.length} }''';
  }

  @override
  List<Object> get props => [status, teams, hasReachedMax];
}
