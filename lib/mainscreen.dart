import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'tvshows/alienworldscard.dart';
import 'tvshows/alteredcarboncard.dart';
import 'tvshows/badbatchcard.dart';
import 'tvshows/discoverycard.dart';
import 'tvshows/enterprisecard.dart';
import 'tvshows/falconwintersoldiercard.dart';
import 'tvshows/forallmankindcard.dart';
import 'tvshows/lostinspacecard.dart';
import 'tvshows/lowerdeckscard.dart';
import 'tvshows/mandaloriancard.dart';
import 'tvshows/nextgencard.dart';
import 'tvshows/orvillecard.dart';
import 'tvshows/picardcard.dart';
import 'tvshows/raisedbywolvescard.dart';
import 'tvshows/voyagercard.dart';
import 'tvshows/startrektvcard.dart';
import 'tvshows/wandavisioncard.dart';
import 'tvshows/lokicard.dart';
import 'tvshows/mastersoftheuniversecard.dart';
import 'tvshows/whatifcard.dart';
import 'tvshows/ythelastmancard.dart';
import 'tvshows/foundationcard.dart';
import 'tvshows/visionscard.dart';
import 'tvshows/prodigycard.dart';
import 'tvshows/wheeloftimecard.dart';
import 'tvshows/cowboybebopcard.dart';
import 'tvshows/hawkeyecard.dart';
import 'tvshows/bookofbobafettcard.dart';
import 'tvshows/reachercard.dart';
import 'tvshows/halocard.dart';
import 'tvshows/moonknightcard.dart';
import 'tvshows/strangenewworldscard.dart';
import 'tvshows/prehistoricplanetcard.dart';
import 'tvshows/obiwankenobicard.dart';
import 'tvshows/msmarvelcard.dart';
import 'tvshows/iamgrootcard.dart';
import 'tvshows/shehulkcard.dart';
import 'tvshows/houseofthedragoncard.dart';
import 'tvshows/thelordoftheringstheringsofpowercard.dart';
import 'tvshows/andorcard.dart';
import 'tvshows/nightskycard.dart';
import 'tvshows/talesofthejedicard.dart';
import 'tvshows/foobarcard.dart';

final List<String> movies = <String>[
  'Action',
  "Arnold",
  'Bruce Willis',
  'Cartoons',
  'Comedy',
  'Drama',
  'Documentary',
  'Fantasy',
  'Godzilla',
  'Harry Potter',
  'Indiana Jones',
  'James Bond',
  'Jurassic Park',
  'John Wick',
  'John Wayne',
  'Kings Men',
  'Men In Black',
  'Misc',
  "Nicolas Cage",
  'Pirates',
  'Riddick',
  'Star Wars',
  'Star Trek',
  'Super Heros',
  'SciFi',
  'Tom Cruize',
  'Transformers',
  'Tremors',
  'The Rock',
  'X-Men',
];

class MainScreen extends StatelessWidget {
  Future<void> stopMov(stopURL) async {
    var resultStop = await http.get(Uri.parse(stopURL));
    return json.decode(resultStop.body);
  }

  Future<void> nextMov(nextURL) async {
    var resultNext = await http.get(Uri.parse(nextURL));
    return json.decode(resultNext.body);
  }

  Future<void> previousMov(previousURL) async {
    var resultPrevious = await http.get(Uri.parse(previousURL));
    return json.decode(resultPrevious.body);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Movies TVShows"),
          backgroundColor: Colors.lightGreen[900],
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.movie_creation_sharp)),
              Tab(icon: Icon(Icons.tv_sharp)),
              Tab(icon: Icon(Icons.tv_sharp)),
              Tab(icon: Icon(Icons.tv_sharp)),
              Tab(icon: Icon(Icons.tv_sharp)),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.lightGreen[900],
          child: Row(
            children: [
              Spacer(),
              IconButton(
                icon: Icon(Icons.skip_previous, color: Colors.white),
                onPressed: () {
                  final String apiPrevious =
                      "http://192.168.0.94:8181/Previous";
                  previousMov(apiPrevious);
                },
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.skip_next, color: Colors.white),
                onPressed: () {
                  final String apiNext = "http://192.168.0.94:8181/Next";
                  nextMov(apiNext);
                },
              ),
              Spacer(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.close_sharp),
            onPressed: () {
              final String apiStop = "http://192.168.0.94:8181/Stop";
              stopMov(apiStop);
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: Container(
          decoration: BoxDecoration(
            color: Colors.lightGreenAccent.shade400,
          ),
          child: TabBarView(
            children: [
              moviesListView,
              tvShowsStarTrekListView(context),
              tvShowsStarWarsListView(context,),
              tvShowsMCUListView(context),
              tvShowsSciFiListView(context),
            ],
          ),
        ),
      ),
    );
  }

  void stop(apath) async {
    final stop = await stopMov(apath);
    return stop;
  }
}

Widget moviesListView = ListView.builder(
  padding: const EdgeInsets.all(10.0),
  itemCount: movies.length,
  itemBuilder: (BuildContext context, int index) {
    return InkWell(
      splashColor: Colors.red,
      // onTap: () {}, // button pressed
      child: Container(
        height: 50,
        color: Colors.amber[400],
        child: Center(
          child: Text(
            '${movies[index]}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28.0,
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, '/${movies[index]}');
      },
    );
  },
);

Widget tvShowsStarTrekListView(BuildContext context) {
  return ListView(
    shrinkWrap: true,
    padding: const EdgeInsets.all(10.0),
    children: <Widget>[
      LowerDecksCard(),
      StrangeNewWorldsCard(),
      ProdigyCard(),
      DiscoveryCard(),
      PicardCard(),
      EnterpriseCard(),
      NextGenCard(),
      VoyagerCard(),
      StarTrekTVCard(),
    ],
  );
}

Widget tvShowsMCUListView(BuildContext context) {
  return ListView(
    shrinkWrap: true,
    padding: const EdgeInsets.all(10.0),
    children: <Widget>[
      IAmGrootCard(),
      MsMarvelCard(),
      LokiCard(),
      HawkeyeCard(),
      VisionsCard(),
      FalconWinterSoldierCard(),
      WandaVisionCard(),
      MoonKnightCard(),
      SheHulkCard(),
      WhatIfCard(),
      // 
    ],
  );
}

Widget tvShowsSciFiListView(BuildContext context) {
  return ListView(
    shrinkWrap: true,
    padding: const EdgeInsets.all(10.0),
    children: <Widget>[
      FooBarCard(),
      OrvilleCard(),
      NightSkyCard(),
      HouseOfTheDragonCard(),
      TheLordOfTheRingsTheRingsOfPowerCard(),
      HaloCard(),
      FoundationCard(),
      WheelOfTimeCard(),
      LostInSpaceCard(),
      ReacherCard(),
      YTheLastManCard(),
      ForAllManKindCard(),
      CowboyBebopCard(),
      PrehistoricPlanetCard(),
      AlienWorldsCard(),
      AlteredCarbonCard(),
      RaisedByWolvesCard(),
      MastersOfTheUniverseCard(),
    ],
  );
}

Widget tvShowsStarWarsListView(BuildContext context) {
  return ListView(
    shrinkWrap: true,
    padding: const EdgeInsets.all(10.0),
    children: <Widget>[
      BadBatchCard(),
      MandalorianCard(),
      BookOfBobaFettCard(),
      ObiWanKenobiCard(),
      AndorCard(),
      TalesOfTheJediCard(),
    ],
  );
}