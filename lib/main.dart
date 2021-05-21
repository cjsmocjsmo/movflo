import 'package:flutter/material.dart';
import 'mainscreen.dart';
import 'moviescreen.dart';
import 'tvshowsscreen.dart'

void main() => runApp(MovFlo());

class MovFlo extends StatelessWidget {
  const MovFlo({Key? key}) : super(key: key);

  static const String _title = "Ampflo";

  Widget build(BuildContext context) {
    return MaterialApp(title: _title, initialRoute: '/', routes: {
      '/': (context) => MainScreen(),
      '/Movies': (context) => MovieScreen(),
      '/TVShows': (context) => TvShowsScreen(),
    });
  }
}