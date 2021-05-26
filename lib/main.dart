import 'package:flutter/material.dart';
import 'actionscreen.dart';
import 'indianajonesscreen.dart';
import 'mainscreen.dart';
import 'tvshowsscreen.dart';

void main() => runApp(MovFlo());

class MovFlo extends StatelessWidget {
  const MovFlo({Key? key}) : super(key: key);

  static const String _title = "MovFlo";

  Widget build(BuildContext context) {
    return MaterialApp(title: _title, initialRoute: '/', routes: {
      '/': (context) => MainScreen(),
      '/Action': (context) => ActionScreen(),
      '/Indiana Jones': (context) => IndianaJonesScreen(),
      '/TVShows': (context) => TvShowsScreen(),
    });
  }
}