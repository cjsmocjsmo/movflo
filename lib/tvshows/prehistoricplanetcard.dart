import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PrehistoricPlanetCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.purple[900],
        child: InkWell(
          splashColor: Colors.red.withAlpha(15),
          onTap: () {
            print('Card tapped.');
          },
          child: SizedBox(
            width: 775.0,
            height: 290.0,
            child: Row(
              children: <Widget>[
                prehistoricImage(),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox.fromSize(
                          size: Size(66, 66),
                          child: ClipOval(
                            child: Material(
                              color: Colors.lightGreenAccent.shade400,
                              child: InkWell(
                                splashColor: Colors.green,
                                onTap: () {
                                  _prehistoricNavigator(context);
                                },
                                child: prehistoricButtonColumn(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget prehistoricImage() {
  return Image.asset(
    'images/prehistoricplanet.jpg',
    fit: BoxFit.contain,
    height: 355.5,
    width: 200.0,
  );
}

_prehistoricNavigator(BuildContext context) {
  return Navigator.push(
    context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Prehistoric Planet"),
            backgroundColor: Colors.lightGreen[900],
          ),
          body: Container(
            decoration: BoxDecoration(
              color: Colors.lightGreenAccent.shade400,
            ),
            child: Center(
              child: mainlistbuilder(),
            ),
          ),
        );
      },
    ),
  );
}

Widget mainlistbuilder() {
  final String apiUrl =
      "http://192.168.0.94:8888/intPrehistoricPlanet?season=01";

  Future<List<dynamic>> fetchEpisodes() async {
    var result;
    try {
      var result = await http.get(Uri.parse(apiUrl));
      return json.decode(result.body);
    } catch (e) {
      print("OOOOOh Fuck");
    }
    return result;
  }

  Future<void> playEpi(playURL) async {
    var resultPlay;
    try {
      var resultPlay = await http.get(Uri.parse(playURL));
      return json.decode(resultPlay.body);
    } catch (e) {
      print("OOOOOH FUUUUCK 2");
    }
    return resultPlay;
  }

  return FutureBuilder<List<dynamic>>(
    future: fetchEpisodes(),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.hasData) {
        return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: snapshot.data.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                String dirp = "/media/pi/PiTB/media/TVShows/";
                String ap = dirp + snapshot.data[index]["tvfspath"];
                final String apiPU =
                    "http://192.168.0.94:8181/OmxplayerPlayMediaReact?medPath=" +
                        ap;
                playEpi(apiPU);
                Navigator.pop(context);
              },
              child: Container(
                height: 75,
                color: Colors.amber[600],
                child: Center(
                  child: Text(
                    '${snapshot.data[index]['title']}',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      } else {
        return CircularProgressIndicator();
      }
    },
  );
}

Widget prehistoricButtonColumn() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        "1",
        style: TextStyle(
          fontFamily: "Gothic",
          fontWeight: FontWeight.bold,
          fontSize: 22,
          color: Colors.black,
        ),
      ), // text
    ],
  );
}
