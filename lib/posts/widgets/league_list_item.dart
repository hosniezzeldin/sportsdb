import 'package:flutter/material.dart';

import '../models/league.dart';

class LeagueListItem extends StatelessWidget {
  const LeagueListItem({required this.post, super.key});

  final League post;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: ListTile(
        title: Text(post.name),
        dense: true,
      ),
    );
  }
}
