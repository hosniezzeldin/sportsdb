part of 'leagues_bloc.dart';

enum LeagueStatus { initial, success, failure }

final class LeagueState extends Equatable {
  const LeagueState({
    this.status = LeagueStatus.initial,
    this.leagues = const <League>[],
    this.hasReachedMax = false,
  });

  final LeagueStatus status;
  final List<League> leagues;
  final bool hasReachedMax;

  LeagueState copyWith({
    LeagueStatus? status,
    List<League>? leagues,
    bool? hasReachedMax,
  }) {
    return LeagueState(
      status: status ?? this.status,
      leagues: leagues ?? this.leagues,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''PostState { status: $status, hasReachedMax: $hasReachedMax, soccer: ${leagues.length} }''';
  }

  @override
  List<Object> get props => [status, leagues, hasReachedMax];
}
