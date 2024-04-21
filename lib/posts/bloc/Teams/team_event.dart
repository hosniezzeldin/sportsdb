part of 'team_bloc.dart';

sealed class SeasonEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class TeamsFetched extends SeasonEvent {}
