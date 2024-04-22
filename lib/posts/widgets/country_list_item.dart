import 'package:flutter/material.dart';

import '../models/country.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({required this.country, super.key});

  final Country country;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: ListTile(
        title: Text(country.name),
        dense: true,
      ),
    );
  }
}
