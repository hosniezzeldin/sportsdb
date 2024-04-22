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
        leading: Image.network(league.strBadge ?? ''),
        title: Text(
          league.name,
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        subtitle: Text(league.strDescriptionEn ?? ''),
        dense: true,
        isThreeLine: true,
      ),
    );
  }
}
