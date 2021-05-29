import 'package:flutter/material.dart';
import 'mainscreen.dart';
import 'movies/actionscreen.dart';
import 'movies/brucewillisscreen.dart';
import 'movies/cartoonsscreen.dart';
import 'movies/comedyscreen.dart';
import 'movies/dramascreen.dart';
import 'movies/documentaryscreen.dart';
import 'movies/fantasyscreen.dart';
import 'movies/godzillascreen.dart';
import 'movies/harrypotterscreen.dart';
import 'movies/indianajonesscreen.dart';
import 'movies/jurassicparkscreen.dart';
import 'movies/johnwickscreen.dart';
import 'movies/johnwaynescreen.dart';
import 'movies/kingsmenscreen.dart';
import 'movies/meninblackscreen.dart';
import 'movies/miscscreen.dart';
import 'movies/piratesscreen.dart';
import 'movies/riddickscreen.dart';
import 'movies/starwarsscreen.dart';



import 'tvshows/tvshowsscreen.dart';

void main() => runApp(MovFlo());

class MovFlo extends StatelessWidget {
  const MovFlo({Key? key}) : super(key: key);

  static const String _title = "MovFlo";

  Widget build(BuildContext context) {
    return MaterialApp(title: _title, initialRoute: '/', routes: {
      '/': (context) => MainScreen(),
      '/Action': (context) => ActionScreen(),
      '/Bruce Willis': (context) => BruceWillisScreen(),
      '/Cartoons': (context) => CartoonsScreen(),
      '/Comedy': (context) => ComedyScreen(),
      '/Drama': (context) => DramaScreen(),
      '/Documentary': (context) => DocumentaryScreen(),
      '/Fantasy': (context) => FantasyScreen(),
      '/Godzilla': (context) => GodzillaScreen(),
      '/Harry Potter': (context) => HarryPotterScreen(),
      '/Indiana Jones': (context) => IndianaJonesScreen(),
      '/Jurassic Park': (context) => JurassicParkScreen(),
      '/John Wick': (context) => JohnWickScreen(),
      '/John Wayne': (context) => JohnWayneScreen(),
      '/Kings Men': (context) => KingsmenScreen(),
      '/Men In Black': (context) => MenInBlackScreen(),
      '/Misc': (context) => MiscScreen(),
      '/Pirates': (context) => PiratesScreen(),
      '/Riddick': (context) => RiddickScreen(),
      '/Star Wars': (context) => StarWarsScreen(),


      '/TVShows': (context) => TvShowsScreen(),
    });
  }
}