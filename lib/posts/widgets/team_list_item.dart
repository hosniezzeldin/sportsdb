import 'package:flutter/material.dart';

import '../models/Team.dart';

class TeamListItem extends StatelessWidget {
  const TeamListItem({required this.team, super.key});

  final Team team;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: ListTile(
        leading: Image.network(team.badge ?? ''),
        title: Text(team.name),
        dense: true,
      ),
    );
  }
}
