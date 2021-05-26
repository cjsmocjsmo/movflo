import 'package:flutter/material.dart';
// import 'dart:async';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

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
  'Star Trek',
  'Falcon Winter Soldier',
  'Voyager',
  'WandaVision',
  'Invincible',
  'The Bad Batch',
];

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
            FloatingActionButton(child: Icon(Icons.close_sharp), onPressed: () {}),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.endDocked,
        body: Container(
          decoration: BoxDecoration(
            color: Colors.lightGreenAccent.shade400,
          ),
          child: TabBarView(
            children: [
              moviesListView,
              tvShowsListView,
            ],
          ),
        ),
      )
    );
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

Widget tvShowsListView = ListView.builder(
  padding: const EdgeInsets.all(10.0),
  itemCount: tvShows.length,
  itemBuilder: (BuildContext context, int index) {
    return InkWell(
      child: Container(
        height: 50,
        color: Colors.amber[400],
        child: Center(
            child: Text('${tvShows[index]}',
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
          '/TVShows',
        );
      },
    );
  }
);
