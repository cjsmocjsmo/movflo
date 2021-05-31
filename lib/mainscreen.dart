import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



import 'tvshows/alienworldscard.dart';
import 'tvshows/alteredcarboncard.dart';
import 'tvshows/discoverycard.dart';
import 'tvshows/falconwintersoldiercard.dart';
import 'tvshows/lowerdeckscard.dart';
import 'tvshows/startrektvcard.dart';


final List<String> movies = <String>[
  'Action',
  'Bruce Willis',
  'Cartoons',
  'Comedy',
  'Drama',
  'Documentary',
  'Fantasy',
  'Godzilla',
  'Harry Potter',
  'Indiana Jones',
  'Jurassic Park',
  'John Wick',
  'John Wayne',
  'Kings Men',
  'Men In Black',
  'Misc',
  'Pirates',
  'Riddick',
  'Star Wars',
  'Star Trek',
  'Super Heros',
  'SciFi',
  'Tom Cruize',
  'Tremors',
  'The Rock',
  'X-Men',
  'MyStatefulWidget'
];

final List<String> tvShows = <String>[
  'Altered Carbon',
  'Alien Worlds',
  'Discovery',
  'Enterprise',
  'For All Man Kind',
  'Last Ship',
  'Lost In Space',
  'Lower Decks',
  'Mandalorian',
  'Next Generation',
  'Orville',
  'Picard',
  'Raised By Wolves',
  'Sean Carroll',
  'SpaceTime',
  'Star Trek TV',
  'Falcon Winter Soldier',
  'Voyager',
  'WandaVision',
  'Invincible',
  'The Bad Batch',
];

class MainScreen extends StatelessWidget {

  Future<void> stopMov(stopURL) async {
    
    var resultStop = await http.get(Uri.parse(stopURL));
    return json.decode(resultStop.body);

  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Movies TVShows"),
          backgroundColor: Colors.lightGreen[900],
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.movie_creation_sharp)),
              Tab(icon: Icon(Icons.tv_sharp)),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            children: [
              // IconButton(icon: Icon(Icons.menu), onPressed: () {}),
              // // Spacer(),
              // IconButton(icon: Icon(Icons.search), onPressed: () {}),
              // IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
            ],
          ),
        ),
        floatingActionButton:
          FloatingActionButton(
          child: Icon(Icons.close_sharp), 
          onPressed: () { 
            final String apiStop = "http://192.168.0.42:8181/Stop";
            stop(apiStop); 
          }
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.endDocked,
        body: Container(
          decoration: BoxDecoration(
            color: Colors.lightGreenAccent.shade400,
          ),
          child: TabBarView(
            children: [
              moviesListView,
              // tvShowsListView(),
              tvShowsListView(context),
              // lowerDecksListView(context),

            ],
          ),
        ),
      )
    );
  }
  void stop(apath) async{
    final stop = await stopMov(apath);
    return stop;
  }
}

Widget moviesListView = ListView.builder(
  padding: const EdgeInsets.all(10.0),
  itemCount: movies.length,
  itemBuilder: (BuildContext context, int index) {
    return InkWell(
      child: Container(
        height: 50,
        color: Colors.amber[400],
        child: Center(
            child: Text('${movies[index]}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22.0,
            )
          )
        ),
      ),
      onTap: () {
        Navigator.pushNamed(
          context,
          '/${movies[index]}',
        );
      },
    );
  }
);

Widget tvShowsListView(BuildContext context) {
  return ListView(
  shrinkWrap: true,
  padding: const EdgeInsets.all(10.0),
  children: <Widget>[
    AlienWorldsCard(),
    AlteredCarbonCard(),
    DiscoveryCard(),
    FalconWinterSoldierCard(),
    LowerDecksCard(),
    StarTrekTVCard(),
    
    
    


  ]);
}

















// This works DONT DELETE
// Widget tvShowsListView = ListView.builder(
//   padding: const EdgeInsets.all(10.0),
//   itemCount: tvShows.length,
//   itemBuilder: (BuildContext context, int index) {
//     return InkWell(
//       child: Container(
//         height: 50,
//         color: Colors.amber[400],
//         child: Center(
//             child: Text('${tvShows[index]}',
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 22.0,
//             )
//           )
//         ),
//       ),
//       onTap: () {
//         Navigator.pushNamed(
//           context,
//           '/${tvShows[index]}',
//         );
//       },
//     );
//   }
// );




