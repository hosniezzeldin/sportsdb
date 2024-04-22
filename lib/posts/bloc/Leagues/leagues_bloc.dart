import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:stream_transform/stream_transform.dart';

import '../../models/league.dart';

part 'leagues_event.dart';
part 'leagues_state.dart';

const _postLimit = 20;
const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class LeagueBloc extends Bloc<LeagueEvent, LeagueState> {
  LeagueBloc({required this.httpClient, required this.country_name})
      : super(const LeagueState()) {
    on<LeagueFetched>(
      _onLeagueFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }
  final String country_name;
  final http.Client httpClient;

  Future<void> _onLeagueFetched(
      LeagueFetched event, Emitter<LeagueState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == LeagueStatus.initial) {
        final posts = await _fetchPosts(country_name);
        return emit(
          state.copyWith(
            status: LeagueStatus.success,
            leagues: posts,
            hasReachedMax: false,
          ),
        );
      }
      final posts = await _fetchPosts(country_name);
      posts!.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
              state.copyWith(
                status: LeagueStatus.success,
                leagues: List.of(state.leagues)..addAll(posts),
                hasReachedMax: false,
              ),
            );
    } catch (_) {
      emit(state.copyWith(status: LeagueStatus.failure));
    }
  }

  Future<List<League>?> _fetchPosts(String country_name) async {
    List<League> leagues = [];

    final response = await httpClient.get(
      Uri.http(
        'www.thesportsdb.com',
        '/api/v1/json/3/search_all_leagues.php',
        <String, String>{'c': country_name},
      ),
    );
    if (response.statusCode == 200) {
      try {
        List<League>? leagues = leaguesFromJson(response.body).countries;
        leagues.sort((a, b) => a.name.compareTo(b.name));

        return leagues;
      } catch (e) {
        print(e.toString());
      }
    } else {
      throw Exception('error fetching posts');
    }
  }
}
