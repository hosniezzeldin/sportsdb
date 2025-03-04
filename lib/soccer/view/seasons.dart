import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:searchable_listview/searchable_listview.dart';
import 'package:soccer/soccer/soccer.dart';
import 'package:soccer/soccer/view/teams.dart';

import '../bloc/Seasons/seasons_bloc.dart';
import '../bloc/Teams/team_bloc.dart';
import '../models/Season.dart';
import '../widgets/season_list_item.dart';

class Seasons extends StatefulWidget {
  const Seasons({super.key, required this.country_name});

  final String country_name;
  @override
  State<Seasons> createState() => _SeasonsState();
}

class _SeasonsState extends State<Seasons> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeasonBloc, SeasonState>(
      builder: (context, state) {
        switch (state.status) {
          case SeasonStatus.failure:
            return const Center(child: Text('failed to fetch countries'));
          case SeasonStatus.success:
            if (state.seasons.isEmpty) {
              return const Center(child: Text('no Seasons to show'));
            }
            return Scaffold(
              body: Container(
                margin: EdgeInsets.only(top: 35.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: renderSimpleSearchableList(state),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );

          case SeasonStatus.initial:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  renderSimpleSearchableList(SeasonState state) {
    return SearchableList<Season>(
      initialList: state.seasons,
      builder: (list, index, item) {
        final Season season = item;
        return GestureDetector(
          onTap: () =>
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return BlocProvider<TeamBloc>(
              create: (context) => TeamBloc(
                country_name: widget.country_name,
                httpClient: http.Client(),
              )..add(TeamsFetched()),
              child: Teams(),
            );
          })),
          child: SeasonListItem(season: season),
        );
      },
      filter: (value) => state.seasons
          .where(
            (element) => element.name.toLowerCase().contains(value),
          )
          .toList(),
      emptyWidget: Container(),
      inputDecoration: InputDecoration(
        labelText: "Search Seasons",
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<CountryBloc>().add(PostFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
