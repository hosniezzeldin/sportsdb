import 'package:flutter/material.dart';

import '../models/Season.dart';

class SeasonListItem extends StatelessWidget {
  const SeasonListItem({required this.post, super.key});

  final Season post;

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
