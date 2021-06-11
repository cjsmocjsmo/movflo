import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class VoyagerCard extends StatelessWidget {

  final String api1Url = "http://192.168.0.42:8888/intVoyager?season=01";
  
  Future<List<dynamic>> fetchVoyagerSeason1() async {
    
      var result = await http.get(Uri.parse(api1Url));
      return json.decode(result.body);
    
  }

  final String api2Url = "http://192.168.0.42:8888/intVoyager?season=02";

  Future<List<dynamic>> fetchVoyagerSeason2() async {
    
      var result = await http.get(Uri.parse(api2Url));
      return json.decode(result.body);
    
  }

  final String api3Url = "http://192.168.0.42:8888/intVoyager?season=03";

  Future<List<dynamic>> fetchVoyagerSeason3() async {
    
      var result = await http.get(Uri.parse(api3Url));
      return json.decode(result.body);
    
  }

  
  final String api4Url = "http://192.168.0.42:8888/intVoyager?season=04";
  

  Future<List<dynamic>> fetchVoyagerSeason4() async {
    
      var result = await http.get(Uri.parse(api4Url));
      return json.decode(result.body);
    
  }

  final String api5Url = "http://192.168.0.42:8888/intVoyager?season=05";

  Future<List<dynamic>> fetchVoyagerSeason5() async {
    
      var result = await http.get(Uri.parse(api5Url));
      return json.decode(result.body);
    
  }

  final String api6Url = "http://192.168.0.42:8888/intVoyager?season=06";

  Future<List<dynamic>> fetchVoyagerSeason6() async {
    
      var result = await http.get(Uri.parse(api6Url));
      return json.decode(result.body);
    
  }

  
  final String api7Url = "http://192.168.0.42:8888/intVoyager?season=07";

  Future<List<dynamic>> fetchVoyagerSeason7() async {
    
      var result = await http.get(Uri.parse(api7Url));
      return json.decode(result.body);
    
  }

  Future<void> playEpi(playURL) async {

    try {
      var resultPlay = await http.get(Uri.parse(playURL));
      return json.decode(resultPlay.body);
    } catch (e) {
      print(e);
    }

  }
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
                  'images/voyager.jpg',
                  fit: BoxFit.contain,
                    height: 355.5,
                    width: 200.0,
                ),
                                Expanded(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                      child: Column(
                        children: <Widget>[
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                 Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 4.0),
                                      child: SizedBox.fromSize(
                                          size: Size(60, 60), // button width and height
                                          child: ClipOval(
                                            child: Material(
                                              color: Colors.lightGreenAccent.shade400, //amber[400], // button color
                                              child: InkWell(
                                                splashColor: Colors.green, // splash color
                                                onTap: () {
                                                  Navigator.push(context, MaterialPageRoute<void>(
                                                    builder: (BuildContext context) {
                                                    return Scaffold(
                                                      appBar: AppBar(
                                                        title: Text("Voyager"),
                                                        backgroundColor: Colors.lightGreen[900],
                                                      ),
                                                      body: Container(
                                                        decoration: BoxDecoration(
                                                          color: Colors.lightGreenAccent.shade400,
                                                        ),
                                                        child: Center(
                                                          child:
                                                            FutureBuilder<List<dynamic>>(
                                                              future: fetchVoyagerSeason1(),
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
                                                                          final String apiPU = "http://192.168.0.42:8181/OmxplayerPlayMediaReact?medPath=" + ap;
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
                                                                }
                                                                
                                                              }),
                                                        )));
                                                  }));
                                      
                                                }, // button pressed
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    // Icon(Icons.call), // icon
                                                    Text(
                                                      "1",
                                                      style: TextStyle(
                                                        fontFamily: "Gothic",
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 22, 
                                                        color: Colors.black),
                                                    ), // text
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                      padding: EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 4.0),
                                      child: SizedBox.fromSize(
                                          size: Size(60, 60), // button width and height
                                          child: ClipOval(
                                            child: Material(
                                              color: Colors.lightGreenAccent.shade400, //amber[400], // button color
                                              child: InkWell(
                                                splashColor: Colors.green, // splash color
                                                onTap: () {
                                                  Navigator.push(context, MaterialPageRoute<void>(
                                                    builder: (BuildContext context) {
                                                    return Scaffold(
                                                      appBar: AppBar(
                                                        title: Text("Voyager"),
                                                        backgroundColor: Colors.lightGreen[900],
                                                      ),
                                                      body: Container(
                                                        decoration: BoxDecoration(
                                                          color: Colors.lightGreenAccent.shade400,
                                                        ),
                                                        child: Center(
                                                          child:
                                                            FutureBuilder<List<dynamic>>(
                                                              future: fetchVoyagerSeason2(),
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
                                                                          final String apiPU = "http://192.168.0.42:8181/OmxplayerPlayMediaReact?medPath=" + ap;
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
                                                                }
                                                                
                                                              }),
                                                        )));
                                                  }));
                                      
                                                }, // button pressed
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    // Icon(Icons.call), // icon
                                                    Text(
                                                      "2",
                                                      style: TextStyle(
                                                        fontFamily: "Gothic",
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 22, 
                                                        color: Colors.black),
                                                    ), // text
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 4.0),
                                        child: SizedBox.fromSize(
                                          size: Size(60, 60), // button width and height
                                          child: ClipOval(
                                            child: Material(
                                              color: Colors.lightGreenAccent.shade400, //amber[400], // button color
                                              child: InkWell(
                                                splashColor: Colors.green, // splash color
                                                onTap: () {
                                                  Navigator.push(context, MaterialPageRoute<void>(
                                                    builder: (BuildContext context) {
                                                    return Scaffold(
                                                      appBar: AppBar(
                                                        title: Text("Voyager"),
                                                        backgroundColor: Colors.lightGreen[900],
                                                      ),
                                                      body: Container(
                                                        decoration: BoxDecoration(
                                                          color: Colors.lightGreenAccent.shade400,
                                                        ),
                                                        child: Center(
                                                          child:
                                                            FutureBuilder<List<dynamic>>(
                                                              future: fetchVoyagerSeason3(),
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
                                                                          final String apiPU = "http://192.168.0.42:8181/OmxplayerPlayMediaReact?medPath=" + ap;
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
                                                                }
                                                                
                                                              }),
                                                        )));
                                                  }));
                                      
                                                }, // button pressed
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    // Icon(Icons.call), // icon
                                                    Text(
                                                      "3",
                                                      style: TextStyle(
                                                        fontFamily: "Gothic",
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 22, 
                                                        color: Colors.black),
                                                    ), // text
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                      padding: EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 4.0),
                                      child: SizedBox.fromSize(
                                          size: Size(60, 60), // button width and height
                                          child: ClipOval(
                                            child: Material(
                                              color: Colors.lightGreenAccent.shade400, //amber[400], // button color
                                              child: InkWell(
                                                splashColor: Colors.green, // splash color
                                                onTap: () {
                                                  Navigator.push(context, MaterialPageRoute<void>(
                                                    builder: (BuildContext context) {
                                                    return Scaffold(
                                                      appBar: AppBar(
                                                        title: Text("Voyager"),
                                                        backgroundColor: Colors.lightGreen[900],
                                                      ),
                                                      body: Container(
                                                        decoration: BoxDecoration(
                                                          color: Colors.lightGreenAccent.shade400,
                                                        ),
                                                        child: Center(
                                                          child:
                                                            FutureBuilder<List<dynamic>>(
                                                              future: fetchVoyagerSeason4(),
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
                                                                          final String apiPU = "http://192.168.0.42:8181/OmxplayerPlayMediaReact?medPath=" + ap;
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
                                                                }
                                                                
                                                              }),
                                                        )));
                                                  }));
                                      
                                                }, // button pressed
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    // Icon(Icons.call), // icon
                                                    Text(
                                                      "4",
                                                      style: TextStyle(
                                                        fontFamily: "Gothic",
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 22, 
                                                        color: Colors.black),
                                                    ), // text
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]),
                                    Column(
                                      children: <Widget>[
                                      Padding(
                                      padding: EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 4.0),
                                      child: SizedBox.fromSize(
                                          size: Size(60, 60), // button width and height
                                          child: ClipOval(
                                            child: Material(
                                              color: Colors.lightGreenAccent.shade400, //amber[400], // button color
                                              child: InkWell(
                                                splashColor: Colors.green, // splash color
                                                onTap: () {
                                                  Navigator.push(context, MaterialPageRoute<void>(
                                                    builder: (BuildContext context) {
                                                    return Scaffold(
                                                      appBar: AppBar(
                                                        title: Text("Voyager"),
                                                        backgroundColor: Colors.lightGreen[900],
                                                      ),
                                                      body: Container(
                                                        decoration: BoxDecoration(
                                                          color: Colors.lightGreenAccent.shade400,
                                                        ),
                                                        child: Center(
                                                          child:
                                                            FutureBuilder<List<dynamic>>(
                                                              future: fetchVoyagerSeason5(),
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
                                                                          final String apiPU = "http://192.168.0.42:8181/OmxplayerPlayMediaReact?medPath=" + ap;
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
                                                                }
                                                                
                                                              }),
                                                        )));
                                                  }));
                                      
                                                }, // button pressed
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    // Icon(Icons.call), // icon
                                                    Text(
                                                      "5",
                                                      style: TextStyle(
                                                        fontFamily: "Gothic",
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 22, 
                                                        color: Colors.black),
                                                    ), // text
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 4.0),
                                        child: SizedBox.fromSize(
                                          size: Size(60, 60), // button width and height
                                          child: ClipOval(
                                            child: Material(
                                              color: Colors.lightGreenAccent.shade400, //amber[400], // button color
                                              child: InkWell(
                                                splashColor: Colors.green, // splash color
                                                onTap: () {
                                                  Navigator.push(context, MaterialPageRoute<void>(
                                                    builder: (BuildContext context) {
                                                    return Scaffold(
                                                      appBar: AppBar(
                                                        title: Text("Voyager"),
                                                        backgroundColor: Colors.lightGreen[900],
                                                      ),
                                                      body: Container(
                                                        decoration: BoxDecoration(
                                                          color: Colors.lightGreenAccent.shade400,
                                                        ),
                                                        child: Center(
                                                          child:
                                                            FutureBuilder<List<dynamic>>(
                                                              future: fetchVoyagerSeason6(),
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
                                                                          final String apiPU = "http://192.168.0.42:8181/OmxplayerPlayMediaReact?medPath=" + ap;
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
                                                                }
                                                                
                                                              }),
                                                        )));
                                                  }));
                                      
                                                }, // button pressed
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    // Icon(Icons.call), // icon
                                                    Text(
                                                      "6",
                                                      style: TextStyle(
                                                        fontFamily: "Gothic",
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 22, 
                                                        color: Colors.black),
                                                    ), // text
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                      padding: EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 4.0),
                                      child: SizedBox.fromSize(
                                          size: Size(60, 60), // button width and height
                                          child: ClipOval(
                                            child: Material(
                                              color: Colors.lightGreenAccent.shade400, //amber[400], // button color
                                              child: InkWell(
                                                splashColor: Colors.green, // splash color
                                                onTap: () {
                                                  Navigator.push(context, MaterialPageRoute<void>(
                                                    builder: (BuildContext context) {
                                                    return Scaffold(
                                                      appBar: AppBar(
                                                        title: Text("Voyager"),
                                                        backgroundColor: Colors.lightGreen[900],
                                                      ),
                                                      body: Container(
                                                        decoration: BoxDecoration(
                                                          color: Colors.lightGreenAccent.shade400,
                                                        ),
                                                        child: Center(
                                                          child:
                                                            FutureBuilder<List<dynamic>>(
                                                              future: fetchVoyagerSeason7(),
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
                                                                          final String apiPU = "http://192.168.0.42:8181/OmxplayerPlayMediaReact?medPath=" + ap;
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
                                                                }
                                                                
                                                              }),
                                                        )));
                                                  }));
                                      
                                                }, // button pressed
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    // Icon(Icons.call), // icon
                                                    Text(
                                                      "7",
                                                      style: TextStyle(
                                                        fontFamily: "Gothic",
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 22, 
                                                        color: Colors.black),
                                                    ), // text
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          ],
                        ),
                      ],   
                    ),
                  ),
                ),
              ]),
            )
        ),
      )
    );
  }
}