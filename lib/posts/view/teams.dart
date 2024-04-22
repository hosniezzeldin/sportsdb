import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_infinite_list/posts/bloc/Teams/team_bloc.dart';
import 'package:flutter_infinite_list/posts/widgets/team_list_item.dart';
import 'package:searchable_listview/searchable_listview.dart';

import '../bloc/Countries/country_bloc.dart';
import '../models/Team.dart';

class Teams extends StatefulWidget {
  const Teams({super.key});

  @override
  State<Teams> createState() => _TeamsState();
}

class _TeamsState extends State<Teams> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeamBloc, TeamState>(
      builder: (context, state) {
        switch (state.status) {
          case TeamStatus.failure:
            return const Center(child: Text('failed to fetch countries'));
          case TeamStatus.success:
            if (state.teams.isEmpty) {
              return const Center(child: Text('no Teams to show'));
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

          case TeamStatus.initial:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  renderSimpleSearchableList(TeamState state) {
    return SearchableList<Team>(
      initialList: state.teams,
      builder: (list, index, item) {
        final Team country = item;

        return TeamListItem(team: country);
      },
      filter: (value) => state.teams
          .where(
            (element) => element.name.toLowerCase().contains(value),
          )
          .toList(),
      emptyWidget: Container(),
      inputDecoration: InputDecoration(
        labelText: "Search Teams",
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
