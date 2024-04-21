import 'package:flutter/material.dart';

import '../models/Team.dart';

class TeamListItem extends StatelessWidget {
  const TeamListItem({required this.post, super.key});

  final Team post;

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
