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
          color: Colors.purple[400],
          child: Row(
            children: [
              Spacer(),
              IconButton(
                icon: Icon(Icons.skip_previous), 
                onPressed: () {
                  final String apiPrevious = "http://192.168.0.42:8181/Previous";
                  previousMov(apiPrevious);
                },
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.skip_next), 
                onPressed: () {
                  final String apiNext = "http://192.168.0.42:8181/Next";
                  nextMov(apiNext);
                },
              ),
              Spacer(),
            ],
          ),
        ),
        floatingActionButton:
          FloatingActionButton(
          child: Icon(Icons.close_sharp), 
          onPressed: () { 
            final String apiStop = "http://192.168.0.42:8181/Stop";
            stopMov(apiStop); 
          }
        ),
        floatingActionButtonLocation:
            // FloatingActionButtonLocation.endDocked,
            FloatingActionButtonLocation.endFloat,
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
    return 
    InkWell(
      splashColor: Colors.red,
      // onTap: () {}, // button pressed
      child: 
        // ListTile(
        //   selected: false,
        //   tileColor: Colors.amber,
        //   title: Text(
        //     '${movies[index]}',
        //     style: TextStyle(
        //       color: Colors.black,
        //       fontSize: 29.0,
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        //   trailing: Icon(Icons.play_arrow, color: Colors.purple[900], size: 29.0),
        //   // selectedTileColor: Colors.blue,
          
        //   onTap: () {
        //     Navigator.pushNamed(context, '/${movies[index]}');
        //   },
        // );
      // Container(
      //   // width: 120.0,
      //   height: 80.0,
      //   child: ElevatedButton(
      //     onPressed: null,
      //     child: Container(
      //       height: 75,
      //       color: Colors.amber[400],
      //       child: Padding(
      //         padding: EdgeInsets.fromLTRB(
      //           20.0, 13.0, 0.0, 0.0,
      //         ),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: <Widget>[
      //             Text(
      //               '${movies[index]}',
      //               style: TextStyle(
      //                 color: Colors.black,
      //                 fontSize: 29.0,
      //                 fontWeight: FontWeight.bold,
      //               ),
      //             ),
      //             Icon(Icons.play_arrow, color: Colors.purple[900], size: 29.0),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
      
      Container(
        height: 50,
        color: Colors.amber[400],
        child: Center(
            child: Text('${movies[index]}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28.0,
            )
          )
        ),
      ),




      onTap: () {
        Navigator.pushNamed(context, '/${movies[index]}');
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
    BadBatchCard(),
    DiscoveryCard(),
    EnterpriseCard(),
    FalconWinterSoldierCard(),
    ForAllManKindCard(),
    LostInSpaceCard(),
    LowerDecksCard(),
    MandalorianCard(),
    NextGenCard(),
    OrvilleCard(),
    PicardCard(),
    RaisedByWolvesCard(),
    StarTrekTVCard(),
    VoyagerCard(),
    WandaVisionCard(),
    
    
    
    


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




