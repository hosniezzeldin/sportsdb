import 'package:flutter/material.dart';

import '../models/Season.dart';

class SeasonListItem extends StatelessWidget {
  const SeasonListItem({required this.season, super.key});

  final Season season;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: ListTile(
        title: Text(season.name),
        dense: true,
      ),
    );
  }
}
