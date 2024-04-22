import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:searchable_listview/searchable_listview.dart';
import 'package:soccer/soccer/bloc/Countries/country_bloc.dart';
import 'package:soccer/soccer/bloc/Leagues/leagues_bloc.dart';

import '../models/country.dart';
import '../widgets/country_list_item.dart';
import 'leagues.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({super.key});

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountryBloc, CountryState>(
      builder: (context, state) {
        switch (state.status) {
          case PostStatus.failure:
            return const Center(child: Text('failed to fetch countries'));
          case PostStatus.success:
            if (state.countries.isEmpty) {
              return const Center(child: Text('no countries to show'));
            }
            return Container(
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
            );

          case PostStatus.initial:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  renderSimpleSearchableList(CountryState state) {
    return SearchableList<Country>(
      initialList: state.countries,
      builder: (list, index, item) {
        final Country country = item;

        return GestureDetector(
          onTap: () =>
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return BlocProvider<LeagueBloc>(
              create: (context) => LeagueBloc(
                  httpClient: http.Client(), country_name: country.name!)
                ..add(LeagueFetched()),
              child: Leagues(country_name: country.name!),
            );
          })),
          child: PostListItem(country: country),
        );
      },
      filter: (value) => state.countries
          .where(
            (element) => element.name!.toLowerCase().contains(value),
          )
          .toList(),
      emptyWidget: Container(),
      inputDecoration: InputDecoration(
        labelText: "Search Countries",
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
