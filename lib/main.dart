import 'package:flutter/material.dart';
import 'mainscreen.dart';
import 'moviescreen.dart';
import 'tvshowsscreen.dart';

void main() => runApp(MovFlo());

class MovFlo extends StatefulWidget {
  const MovFlo({Key? key}) : super(key: key);

  static const String _title = "Ampflo";

  @override 
  _ActionState createState() => _ActionState();
  _BruceWillisState createState() => _BruceWillisState();


  Widget build(BuildContext context) {
    return MaterialApp(title: _title, initialRoute: '/', routes: {
      '/': (context) => MainScreen(),
      '/Movies': (context) => MovieScreen(),
      '/TVShows': (context) => TvShowsScreen(),
    });
  }
}