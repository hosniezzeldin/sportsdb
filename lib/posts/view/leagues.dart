import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_infinite_list/posts/bloc/Leagues/leagues_bloc.dart';
import 'package:flutter_infinite_list/posts/posts.dart';
import 'package:flutter_infinite_list/posts/widgets/league_list_item.dart';
import 'package:searchable_listview/searchable_listview.dart';

import '../models/league.dart';

class Leagues extends StatefulWidget {
  const Leagues({super.key});

  @override
  State<Leagues> createState() => _LeaguesState();
}

class _LeaguesState extends State<Leagues> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeagueBloc, LeagueState>(
      builder: (context, state) {
        switch (state.status) {
          case LeagueStatus.failure:
            return const Center(child: Text('failed to fetch countries'));
          case LeagueStatus.success:
            if (state.leagues.isEmpty) {
              return const Center(child: Text('no countries to show'));
            }
            return Scaffold(
              body: Container(
                margin: EdgeInsets.only(top: 15.0),
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

          case LeagueStatus.initial:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  renderSimpleSearchableList(LeagueState state) {
    return SearchableList<League>(
      initialList: state.leagues,
      builder: (list, index, item) {
        final League country = item;

        return LeagueListItem(post: country);
      },
      filter: (value) => state.leagues
          .where(
            (element) => element.name.toLowerCase().contains(value),
          )
          .toList(),
      emptyWidget: Container(),
      inputDecoration: InputDecoration(
        labelText: "Search Country",
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
