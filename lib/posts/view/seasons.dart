import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_infinite_list/posts/posts.dart';
import 'package:flutter_infinite_list/posts/widgets/season_list_item.dart';
import 'package:searchable_listview/searchable_listview.dart';

import '../bloc/Seasons/seasons_bloc.dart';
import '../models/Season.dart';

class Seasons extends StatefulWidget {
  const Seasons({super.key});

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
        final Season country = item;

        return SeasonListItem(post: country);
      },
      filter: (value) => state.seasons
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
