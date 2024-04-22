import 'package:flutter/material.dart';

import '../models/country.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({required this.post, super.key});

  final Country post;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: ListTile(
        title: Text(post.name!),
        dense: true,
      ),
    );
  }
}
