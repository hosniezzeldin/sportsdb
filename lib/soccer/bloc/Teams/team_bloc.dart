import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:stream_transform/stream_transform.dart';

import '../../models/Team.dart';

part 'team_event.dart';
part 'team_state.dart';

const _postLimit = 20;
const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class TeamBloc extends Bloc<SeasonEvent, TeamState> {
  TeamBloc({required this.httpClient, required this.country_name})
      : super(const TeamState()) {
    on<TeamsFetched>(
      _onLeagueFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }
  final String country_name;
  final http.Client httpClient;

  Future<void> _onLeagueFetched(
      TeamsFetched event, Emitter<TeamState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == TeamStatus.initial) {
        final teams = await _fetchPosts(country_name);
        return emit(
          state.copyWith(
            status: TeamStatus.success,
            teams: teams,
            hasReachedMax: false,
          ),
        );
      }
      final posts = await _fetchPosts(country_name);
      posts.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
              state.copyWith(
                status: TeamStatus.success,
                teams: List.of(state.teams)..addAll(posts),
                hasReachedMax: false,
              ),
            );
    } catch (_) {
      emit(state.copyWith(status: TeamStatus.failure));
    }
  }

  Future<List<Team>> _fetchPosts(String country_name) async {
    List<Team> teams = [];

    final response = await httpClient.get(
      Uri.http(
        'www.thesportsdb.com',
        '/api/v1/json/3/search_all_teams.php',
        <String, String>{'s': 'soccer', 'c': country_name},
      ),
    );
    if (response.statusCode == 200) {
      teams = teamsFromJson(response.body).teams;

      teams.sort((a, b) => a.name.compareTo(b.name));
      return teams;
    }

    throw Exception('error fetching soccer');
  }
}
