part of 'country_bloc.dart';

enum PostStatus { initial, success, failure }

final class CountryState extends Equatable {
  const CountryState({
    this.status = PostStatus.initial,
    this.countries = const <Country>[],
    this.hasReachedMax = false,
  });

  final PostStatus status;
  final List<Country> countries;
  final bool hasReachedMax;

  CountryState copyWith({
    PostStatus? status,
    List<Country>? countries,
    bool? hasReachedMax,
  }) {
    return CountryState(
      status: status ?? this.status,
      countries: countries ?? this.countries,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''PostState { status: $status, hasReachedMax: $hasReachedMax, soccer: ${countries.length} }''';
  }

  @override
  List<Object> get props => [status, countries, hasReachedMax];
}
