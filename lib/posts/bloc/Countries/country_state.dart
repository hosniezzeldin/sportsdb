part of 'country_bloc.dart';

enum PostStatus { initial, success, failure }

final class CountryState extends Equatable {
  const CountryState({
    this.status = PostStatus.initial,
    this.posts = const <Country>[],
    this.hasReachedMax = false,
  });

  final PostStatus status;
  final List<Country> posts;
  final bool hasReachedMax;

  CountryState copyWith({
    PostStatus? status,
    List<Country>? posts,
    bool? hasReachedMax,
  }) {
    return CountryState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''PostState { status: $status, hasReachedMax: $hasReachedMax, posts: ${posts.length} }''';
  }

  @override
  List<Object> get props => [status, posts, hasReachedMax];
}
