import 'package:flutter/material.dart';
import 'package:soccer/soccer/view/main_page.dart';

class App extends MaterialApp {
  const App({super.key})
      : super(home: const PostsPage(), debugShowCheckedModeBanner: false);
}
