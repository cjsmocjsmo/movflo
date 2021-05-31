import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'tvshows/startrektvcard.dart';
import 'tvshows/lowerdeckscard.dart';

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

// void starTrekNav(context) {
//   Navigator.pushNamed(context, '/Star Trek TV');
// }

Widget tvShowsListView(BuildContext context) {
  return ListView(
  shrinkWrap: true,
  padding: const EdgeInsets.all(10.0),
  children: <Widget>[
    StarTrekTVCard(),
    LowerDecksCard(),
    
    // Center(
    //   child: Card(
    //     color: Colors.purple[900],
    //     child: InkWell(
    //       splashColor: Colors.red.withAlpha(15),
    //       onTap: () {
    //         print('Card tapped.');
    //       },
    //       child: SizedBox(
    //         width: 775.0,
    //         height: 290.0,
    //         child: Row(
    //           children: <Widget>[
    //             Image.asset(
    //               'images/lowerdecks.jpg',
    //               fit: BoxFit.contain,
    //                 height: 355.5,
    //                 width: 200.0,
    //             ),
    //             Expanded(
    //               child: Column(
    //               children: <Widget>[
    //                 TextButton(
    //                   child: const Text('Season 1'),
    //                   style: TextButton.styleFrom(
    //                     textStyle: TextStyle(fontSize: 32, color: Colors.white)
    //                   ),
    //                   onPressed: () {
    //                     starTrekNav(context);
    //                   },
    //                 ),
    //                 const SizedBox(width: 12),
    //                 TextButton(
    //                   child: const Text('Season 2'),
    //                   style: TextButton.styleFrom(
    //                     textStyle: TextStyle(fontSize: 32)
    //                   ),
    //                   onPressed: () {
    //                     starTrekNav(context);
    //                   },
    //                 ),
    //                 const SizedBox(width: 12),
    //                 TextButton(
    //                   child: const Text('Season 3'),
    //                   style: TextButton.styleFrom(
    //                     textStyle: TextStyle(fontSize: 32)
    //                   ),
    //                   onPressed: () {
    //                     starTrekNav(context);
    //                   },
    //                 ),
    //                 const SizedBox(width: 12),
    //                 TextButton(
    //                   child: const Text('Season 4'),
    //                   style: TextButton.styleFrom(
    //                     textStyle: TextStyle(fontSize: 32)
    //                   ),
    //                   onPressed: () {
    //                     starTrekNav(context);
    //                   },
    //                 ),
    //                 const SizedBox(width: 12),
    //                 TextButton(
    //                   child: const Text('Season 5'),
    //                   style: TextButton.styleFrom(
    //                     textStyle: TextStyle(fontSize: 32)
    //                   ),
    //                   onPressed: () {
    //                     starTrekNav(context);
    //                   },
    //                 ),
    //                 const SizedBox(width: 12),
    //                 TextButton(
    //                   child: const Text('Season 6'),
    //                   style: TextButton.styleFrom(
    //                     textStyle: TextStyle(fontSize: 32)
    //                   ),
    //                   onPressed: () {
    //                     starTrekNav(context);
    //                   },
    //                 ),
    //                 const SizedBox(width: 12),
    //                 TextButton(
    //                   child: const Text('Season 7'),
    //                   style: TextButton.styleFrom(
    //                     textStyle: TextStyle(fontSize: 32)
    //                   ),
    //                   onPressed: () {
    //                     starTrekNav(context);
    //                   },
    //                 ),
    //                 const SizedBox(width: 12),

    //               ]
    //             )),
    //           ]),
    //         )
    //     ),
    //   )
    // ),




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




