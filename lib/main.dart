import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

void main() => runApp(MovFlo());

class MovFlo extends StatelessWidget {
  const MovFlo({Key? key}) : super(key: key);

  static const String _title = "Ampflo";

  Widget build(BuildContext context) {
    return MaterialApp(title: _title, initialRoute: '/', routes: {
      '/': (context) => MainScreen(),
      '/Home': (context) => MoviesScreen(),
      '/Playlists': (context) => TvShowsScreen(),
    });
  }
}