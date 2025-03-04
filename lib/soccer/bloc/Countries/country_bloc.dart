import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:soccer/soccer/models/country.dart';
import 'package:stream_transform/stream_transform.dart';

part 'country_event.dart';
part 'country_state.dart';

const _postLimit = 20;
const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  CountryBloc({required this.httpClient}) : super(const CountryState()) {
    on<PostFetched>(
      _onPostFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  final http.Client httpClient;

  Future<void> _onPostFetched(
    PostFetched event,
    Emitter<CountryState> emit,
  ) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == PostStatus.initial) {
        final countries = await _fetchPosts();
        return emit(
          state.copyWith(
            status: PostStatus.success,
            countries: countries,
            hasReachedMax: false,
          ),
        );
      }
      final posts = await _fetchPosts();
      posts.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
              state.copyWith(
                status: PostStatus.success,
                countries: List.of(state.countries)..addAll(posts),
                hasReachedMax: false,
              ),
            );
    } catch (_) {
      emit(state.copyWith(status: PostStatus.failure));
    }
  }

  Future<List<Country>> _fetchPosts() async {
    final response = await httpClient.get(
      Uri.http(
        'www.thesportsdb.com',
        '/api/v1/json/3/all_countries.php',
      ),
    );
    if (response.statusCode == 200) {
      List<Country> countries = countryFromJson(response.body).countries!;
      countries.sort((a, b) => a.name.compareTo(b.name));

      return countries;
    } else {
      return [];
    }
  }
}
