import 'package:flutter/material.dart';

import '../models/league.dart';

class LeagueListItem extends StatelessWidget {
  const LeagueListItem({required this.league, super.key});

  final League league;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: ListTile(
        leading: Image.network(league.badge ?? ''),
        title: Text(league.name),
        dense: true,
      ),
    );
  }
}
