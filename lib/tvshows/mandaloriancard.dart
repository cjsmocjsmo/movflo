import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MandalorianCard extends StatelessWidget {

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
                Image.asset(
                  'images/mandalorian.jpg',
                  fit: BoxFit.contain,
                    height: 355.5,
                    width: 200.0,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                  child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                      child: SizedBox.fromSize(
                          size: Size(66, 66), // button width and height
                          child: ClipOval(
                            child: Material(
                              color: Colors.lightGreenAccent.shade400, //amber[400], // button color
                              child: InkWell(
                                splashColor: Colors.green, // splash color
                                onTap: () {
                                  _mandalorian(context, '1');
                                }, // button pressed
                                child: _mandalorianButtonColumn('1')
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                      child: SizedBox.fromSize(
                          size: Size(66, 66), // button width and height
                          child: ClipOval(
                            child: Material(
                              color: Colors.lightGreenAccent.shade400, //amber[400], // button color
                              child: InkWell(
                                splashColor: Colors.green, // splash color
                                onTap: () {
                                  _mandalorian(context, '2');
                                }, // button pressed
                                child: _mandalorianButtonColumn('2')
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                        child: SizedBox.fromSize(
                          size: Size(66, 66), // button width and height
                          child: ClipOval(
                            child: Material(
                              color: Colors.lightGreenAccent.shade400, //amber[400], // button color
                              child: InkWell(
                                splashColor: Colors.green, // splash color
                                onTap: () {
                                  _mandalorian(context, '3');
                                }, // button pressed
                                child: _mandalorianButtonColumn('3')
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              ]
            ),
          )
        ),
      )
    );
  }
}

Future<void> playEpi(playURL) async {
  try {
    var resultPlay = await http.get(Uri.parse(playURL));
    return json.decode(resultPlay.body);
  } catch (e) {
    print(e);
  }
}

_mandalorian(BuildContext context, String season_num) {

  Future<List<dynamic>> fetchMandalorian() async {
    final String api1Url = "http://192.168.0.93:8080/intMandalorian?season=01";
    final String api2Url = "http://192.168.0.93:8080/intMandalorian?season=02";
    if (season_num == '1') {
      var result = await http.get(Uri.parse(api1Url));
      return json.decode(result.body);
    } else {
      var result = await http.get(Uri.parse(api2Url));
      return json.decode(result.body);
    }

    // final String api3Url = "http://192.168.0.93:8080/intMandalorian?season=03";

    // if (season_num == '1') {
    //   var result = await http.get(Uri.parse(api1Url));
    //   return json.decode(result.body);
    // } else if (season_num == '2') {
    //   var result = await http.get(Uri.parse(api2Url));
    //   return json.decode(result.body);
    // } else {
    //   var result = await http.get(Uri.parse(api3Url));
    //   return json.decode(result.body);
    // }
  }
  return Navigator.push(context, MaterialPageRoute<void>(
    builder: (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mandalorian"),
        backgroundColor: Colors.lightGreen[900],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.lightGreenAccent.shade400,
        ),
        child: Center(
          child:
            FutureBuilder<List<dynamic>>(
              future: fetchMandalorian(),
              builder: (BuildContext context,AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          String dirp = "/media/pi/PiTB/media/TVShows";
                          String ap = dirp + snapshot.data[index]["tvfspath"];
                          final String apiPU = "http://192.168.0.93:8181/OmxplayerPlayMediaReact?medPath=" + ap;
                          playEpi(apiPU);
                          Navigator.pop(context);
                        },
                        child: 
                        Container(
                          height: 75,
                          color: Colors.amber[600],
                          child:Center(
                            child: Text(
                              '${snapshot.data[index]['title']}',
                              style: TextStyle(fontSize: 32, color: Colors.black),
                            ),
                          ),
                        ),
                      );
                    });
                } else {
                  return CircularProgressIndicator();
                }}
              ),
            ),
          ),
        );
      }
    ),
  );
}

_mandalorianButtonColumn(String episode) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        episode,
        style: TextStyle(
          fontFamily: "Gothic",
          fontWeight: FontWeight.bold,
          fontSize: 22, 
          color: Colors.black),
      ), // text
    ],
  );
}