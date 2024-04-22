import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_infinite_list/posts/soccer.dart';
import 'package:http/http.dart' as http;

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) =>
            CountryBloc(httpClient: http.Client())..add(PostFetched()),
        child: const CountriesList(),
      ),
    );
  }
}
