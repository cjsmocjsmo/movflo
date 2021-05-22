import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:async';

// Action page

Future<Movies> fetchMovies() async {
  final response =
      await http.get(Uri.parse('http://192.168.0.42:8888/intAction'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Movies.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Movies');
  }
}

class Movies {
  final String carosthumbpath;
  final String catagory;
  final String dirpath;
  final String filepath;
  final String genre;
  final String mediaid;
  final String movfspath;
  final String movname;
  final String movyear;
  final String thumbpath

  // final int userId;
  // final int id;
  // final String title;

  Movies({
    // required this.userId,
    // required this.id,
    // required this.title,
    required this.carosthumbpath,
    required this.catagory,
    required this.dirpath,
    required this.filepath,
    required this.genre,
    required this.mediaid,
    required this.movfspath,
    required this.movname,
    required this.movyear,
    required this.thumbpath,
  });

  factory Movies.fromJson(Map<String, dynamic> json) {
    return Movies(
      carosthumbpath: json['carosthumbpath'],
      catagory: json['catagory'],
      dirpath: json['dirpath'],
      filepath: json['filepath'],
      genre: json['genre'],
      mediaid: json['mediaid'],
      movfspath: json['movfspath'],
      movname: json['movname'],
      movyear: json['movyear'],
      thumbpath: json['thumbpath'],
    );
  }
}




class _ActionState extends State<MovFlo> {
  late Future<Movies> futureMovies;

  @override 
  void initState() {
    super.initState();
    futureMovies = fetchMovies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[900],
        title: Text(
          "Movies",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.lightGreenAccent.shade400,
        ),
        child: testGridView,
      )
    );
  }
}

Widget testGridView = GridView.builder(
  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
    maxCrossAxisExtent: 200,
    childAspectRatio: 3 / 2,
    crossAxisSpacing: 20,
    mainAxisSpacing: 20,
  ),
  itemCount: 25,
  itemBuilder: (BuildContext context, index) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Image.asset(
          'images/two.jpg',
          height: 250.0,
          width: 250.0,
        )
      )
    );
  }
);

Widget listViewHomeZ = ListView.builder(
  itemCount: 18,
  itemBuilder: (BuildContext context, int index) {
    return Card(
      color: Colors.amber[400],
      child: ListTile(
        title: Text("Mexican Black Bird"),
        subtitle: Text('Fandango'),
        leading:
            Image.asset('images/two2.jpg', height: 250.0, width: 200.0),
        trailing: Text("13"),
        onTap: () {
          Navigator.pop(context);
        }
      ),
    );
  }
);


// {
// "carosthumbpath":"",
// "catagory":"Action",
// "dirpath":"/root/fsData/Movies/Action/",
// "filepath":"/root/fsData/Movies/Action/12 Strong (2018).mp4",
// "genre":"movies",
// "mediaid":"581522202723959929",
// "movfspath":"/media/pi/PiTB/media/Movies/Action/12 Strong (2018).mp4",
// "movname":"",
// "movyear":"2018",
// "thumbpath":"./static/12 Strong (2018).jpg"

// return {"movfspath":da.movfspath, "movname":da.movname, "thumbpath":thumbpath}