part of 'country_bloc.dart';

sealed class CountryEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class PostFetched extends CountryEvent {}
