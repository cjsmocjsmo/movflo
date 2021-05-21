import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
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
                  Tab(icon: Icon(Icons.directions_car)),
                  Tab(icon: Icon(Icons.directions_transit)),
                  // Tab(icon: Icon(Icons.directions_bike)),
                ],
              ),
              // actions: <Widget>[
              //   IconButton(
              //       onPressed: () {
              //         Navigator.pushNamed(context, '/Movies');
              //       },
              //       icon: Icon(Icons.album_sharp),
              //       tooltip: "Go to Movies Page"),
              //   IconButton(
              //       onPressed: () {
              //         Navigator.pushNamed(context, '/TVShows');
              //       },
              //       icon: Icon(Icons.add_rounded),
              //       tooltip: "Go To TVShows Page"),
              //   // IconButton(
              //   //     onPressed: () {
              //   //       Navigator.pushNamed(context, '/');
              //   //     },
              //   //     icon: Icon(Icons.exit_to_app_sharp),
              //   //     tooltip: "Exit App"),
              //   IconButton(
              //     icon: const Icon(Icons.add_alert),
              //     tooltip: 'Show Snackbar',
              //     onPressed: () {
              //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //         content: Text('ZZ Top \n Fandango \n Mexican Black Bird'),
              //         backgroundColor: Colors.purple,
              //       ));
              //     },
              //   ),
              // ]
            ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.lightGreenAccent.shade400,
          ),
          child: TabBarView(
            children: [
              moviesListView,
              tvShowsListView,

              // Icon(Icons.directions_car),
              // Icon(Icons.directions_transit),
              // Icon(Icons.directions_car),
              // Icon(Icons.directions_transit),
              // Icon(Icons.directions_bike),
            ],
          ),
        ),
        
        // Container(
        //   decoration: BoxDecoration(
        //     color: Colors.lightGreenAccent.shade400,
        //   ),
        //   child: Center(
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Text('Viewing playlist page'),
        //         ElevatedButton(
        //           style: ButtonStyle(
        //             backgroundColor:
        //                 MaterialStateProperty.all<Color>(Colors.lightGreen),
        //           ),
        //           child: Text('Pop!'),
        //           onPressed: () {
        //             Navigator.pop(context);
        //           },
        //         ),
        //       ],
        //     ),
        //   ),
        // )
      )
    );
  }
}

final List<String> movies = <String>[
  'Action', 'Bruce Willis', 'Cartoons', 'Comedy', 'Drama', 'Documentary',
  'Fantasy', 'Godzilla', 'Harry Potter', 'Indiana Jones', 'Jurassic Park',
  'John Wick', 'John Wayne', 'Kings Men', 'Men In Black', 'Misc',
  'Pirates', 'Riddick', 'Star Wars', 'Star Trek', 'Super Heros',
  'SciFi', 'Tom Cruize', 'Tremors', 'The Rock', 'X-Men',
]

final List<String> tvShows = <String>[
  'Altered Carbon', 'Alien Worlds',
  'Discovery', 'Enterprise', 'For All Man Kind', 'Last Ship', 'Lost In Space',
  'Lower Decks', 'Mandalorian', 'Next Generation', 'Orville', 'Picard',
  'Raised By Wolves', 'Sean Carroll', 'SpaceTime', 'Star Trek',
  'Falcon Winter Soldier', 'Voyager', 'WandaVision', 'Invincible',
  'The Bad Batch',
 
]


Widget moviesListView = ListView.builder(
  padding: const EdgeInsets.all(10.0),
  itemCount: movies.length,
  itemBuilder: (BuildContext context, int index) {
    return Container(
      height: 50,
      color: Colors.amber[400],
      child: Center(
        child: Text(
          '${movies[index]}',
          fontWeight: FontWeight.bold,
          style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.5),
          )),
    );
  }
);

Widget tvShowsListView = ListView.builder(
  padding: const EdgeInsets.all(10.0),
  itemCount: tvShows.length,
  itemBuilder: (BuildContext context, int index) {
    return Container(
      height: 50,
      color: Colors.amber[400],
      child: Center(child: Text('${tvShows[index]}')),
    );
  }
);