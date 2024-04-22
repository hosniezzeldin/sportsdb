import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:stream_transform/stream_transform.dart';

import '../../models/Season.dart';

part 'seasons_event.dart';
part 'seasons_state.dart';

const _postLimit = 20;
const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class SeasonBloc extends Bloc<SeasonEvent, SeasonState> {
  SeasonBloc({required this.httpClient, required this.league_id})
      : super(const SeasonState()) {
    on<SeasonFetched>(
      _onLeagueFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }
  final String league_id;
  final http.Client httpClient;

  Future<void> _onLeagueFetched(
      SeasonFetched event, Emitter<SeasonState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == SeasonStatus.initial) {
        final posts = await _fetchPosts(league_id);
        return emit(
          state.copyWith(
            status: SeasonStatus.success,
            seasons: posts,
            hasReachedMax: false,
          ),
        );
      }
      final posts = await _fetchPosts(league_id);
      posts.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
              state.copyWith(
                status: SeasonStatus.success,
                seasons: List.of(state.seasons)..addAll(posts),
                hasReachedMax: false,
              ),
            );
    } catch (_) {
      emit(state.copyWith(status: SeasonStatus.failure));
    }
  }

  Future<List<Season>> _fetchPosts(String league_id) async {
    List<Season> seasons = [];

    final response = await httpClient.get(
      Uri.http(
        'www.thesportsdb.com',
        '/api/v1/json/3/search_all_seasons.php',
        <String, String>{'id': league_id},
      ),
    );
    if (response.statusCode == 200) {
      seasons = seasonsFromJson(response.body).seasons;
      seasons.sort((a, b) => a.name.compareTo(b.name));
      return seasons;
    }

    throw Exception('error fetching posts');
  }
}
