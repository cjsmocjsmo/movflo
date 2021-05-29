import 'package:flutter/material.dart';
import 'mainscreen.dart';
import 'movies/actionscreen.dart';
import 'movies/dramascreen.dart';
import 'movies/indianajonesscreen.dart';
import 'tvshows/tvshowsscreen.dart';

void main() => runApp(MovFlo());

class MovFlo extends StatelessWidget {
  const MovFlo({Key? key}) : super(key: key);

  static const String _title = "MovFlo";

  Widget build(BuildContext context) {
    return MaterialApp(title: _title, initialRoute: '/', routes: {
      '/': (context) => MainScreen(),
      '/Action': (context) => ActionScreen(),
      '/Drama': (context) => DramaScreen(),
      '/Indiana Jones': (context) => IndianaJonesScreen(),
      '/TVShows': (context) => TvShowsScreen(),
    });
  }
}