part of 'seasons_bloc.dart';

sealed class SeasonEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class SeasonFetched extends SeasonEvent {}
