part of 'leagues_bloc.dart';

sealed class LeagueEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class LeagueFetched extends LeagueEvent {}
