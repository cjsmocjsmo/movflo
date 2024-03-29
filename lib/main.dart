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
import 'movies/nicolascagescreen.dart';
import 'movies/piratesscreen.dart';
import 'movies/riddickscreen.dart';
import 'movies/starwarsscreen.dart';
import 'movies/startrekscreen.dart';
import 'movies/superherosscreen.dart';
import 'movies/scifiscreen.dart';
import 'movies/tomcruizescreen.dart';
import 'movies/tremorsscreen.dart';
import 'movies/therockscreen.dart';
import 'movies/xmenscreen.dart';
import 'movies/arnoldscreen.dart';
import 'tvshows/startrektvcard.dart';
import 'movies/jamesbondscreen.dart';
import 'movies/transformersscreen.dart';

void main() => runApp(MovFlo());

class MovFlo extends StatelessWidget {
  const MovFlo({Key? key}) : super(key: key);

  static const String _title = "MovFlo";

  Widget build(BuildContext context) {
    return MaterialApp(title: _title, initialRoute: '/', routes: {
      '/': (context) => MainScreen(),
      '/Action': (context) => ActionScreen(),
      '/Arnold': (context) => ArnoldScreen(),
      '/Bruce Willis': (context) => BruceWillisScreen(),
      '/Cartoons': (context) => CartoonsScreen(),
      '/Comedy': (context) => ComedyScreen(),
      '/Drama': (context) => DramaScreen(),
      '/Documentary': (context) => DocumentaryScreen(),
      '/Fantasy': (context) => FantasyScreen(),
      '/Godzilla': (context) => GodzillaScreen(),
      '/Harry Potter': (context) => HarryPotterScreen(),
      '/Indiana Jones': (context) => IndianaJonesScreen(),
      '/James Bond': (context) => JamesBondScreen(),
      '/John Wayne': (context) => JohnWayneScreen(),
      '/John Wick': (context) => JohnWickScreen(),
      '/Jurassic Park': (context) => JurassicParkScreen(),
      '/Kings Men': (context) => KingsmenScreen(),
      '/Men In Black': (context) => MenInBlackScreen(),
      '/Misc': (context) => MiscScreen(),
      '/Nicolas Cage': (context) => NicolasCageScreen(),
      '/Pirates': (context) => PiratesScreen(),
      '/Riddick': (context) => RiddickScreen(),
      '/SciFi': (context) => SciFiScreen(),
      '/Star Trek': (context) => StarTrekScreen(),
      '/Star Trek TV': (context) => StarTrekTVCard(),
      '/Star Wars': (context) => StarWarsScreen(),
      '/Super Heros': (context) => SuperHerosScreen(),
      '/The Rock': (context) => TheRockScreen(),
      '/Tom Cruize': (context) => TomCruizeScreen(),
      '/Transformers': (context) => TransformersScreen(),
      '/Tremors': (context) => TremorsScreen(),
      '/X-Men': (context) => XMenScreen(),
    });
  }
}
