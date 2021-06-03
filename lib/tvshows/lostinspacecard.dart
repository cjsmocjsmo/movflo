import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LostInSpaceCard extends StatelessWidget {

  final String api1Url = "http://192.168.0.42:8888/intLostInSpace?season=01";
  
  Future<List<dynamic>> fetchLostInSpaceSeason1() async {
    
      var result = await http.get(Uri.parse(api1Url));
      return json.decode(result.body);
    
  }

  final String api2Url = "http://192.168.0.42:8888/intLostInSpace?season=02";

  Future<List<dynamic>> fetchLostInSpaceSeason2() async {
    
      var result = await http.get(Uri.parse(api2Url));
      return json.decode(result.body);
    
  }

  final String api3Url = "http://192.168.0.42:8888/intLostInSpace?season=03";

  Future<List<dynamic>> fetchLostInSpaceSeason3() async {
    
      var result = await http.get(Uri.parse(api3Url));
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
                  'images/lostinspace.jpg',
                  fit: BoxFit.contain,
                    height: 355.5,
                    width: 200.0,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),

                  child: Column(
                  children: <Widget>[
                                        TextButton(
                      child: const Text('Season 1'),
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(fontSize: 32, color: Colors.white)
                      ),
                      onPressed: () {
                        Navigator.push(context,
                          MaterialPageRoute<void>(builder: (BuildContext context) {
                            return Scaffold(
                              appBar: AppBar(
                                title: Text("LostInSpace"),
                                backgroundColor: Colors.lightGreen[900],
                              ),
                              body: Container(
                              decoration: BoxDecoration(
                                color: Colors.lightGreenAccent.shade400,
                              ),
                              
                              child: Center(
                                child: FutureBuilder<List<dynamic>>(
                                  future: fetchLostInSpaceSeason1(),
                                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                                    if(snapshot.hasData){
                                      print(snapshot.data[0]['tvfspath']);
                                      return ListView.builder(
                                        padding: const EdgeInsets.all(8),
                                        itemCount: snapshot.data.length,
                                        itemBuilder: (BuildContext context, int index) {
                                          return GestureDetector(
                                            onTap: () {
                                              print(snapshot.data[index]);
                                              String dirp = "/media/pi/PiTB/media/TVShows";
                                              String ap = dirp + snapshot.data[index]['tvfspath'];
                                              print(ap);
                                              final String apiPU = "http://192.168.0.42:8181/OmxplayerPlayMediaReact?medPath=${ap}";
                                              playEpi(apiPU);
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              height: 50,
                                              color: Colors.amber[600],
                                              child: Center(
                                                child: Text(
                                                  '${snapshot.data[index]['title']}',
                                                  style: TextStyle(fontSize: 32, color: Colors.black),
                                                ),
                                              ),
                                            )
                                          );
                                        }
                                      );
                                    } else {
                                      return Text("OOOOOOOH FUCK");
                                    }
                                    return CircularProgressIndicator();
                                  }
                                ),
                            )));
                            }
                          )
                        );
                      },
                    ),
                    const SizedBox(width: 12),
                    TextButton(
                      child: const Text('Season 2'),
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(fontSize: 32)
                      ),
                      onPressed: () {
                         Navigator.push(context,
                          MaterialPageRoute<void>(builder: (BuildContext context) {
                            return Scaffold(
                              appBar: AppBar(
                                title: Text("LostInSpace"),
                                backgroundColor: Colors.lightGreen[900],
                              ),
                              body: Container(
                              decoration: BoxDecoration(
                                color: Colors.lightGreenAccent.shade400,
                              ),
                              
                              child: Center(
                                child: FutureBuilder<List<dynamic>>(
                                  future: fetchLostInSpaceSeason2(),
                                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                                    if(snapshot.hasData){
                                      print(snapshot.data[0]['tvfspath']);
                                      return ListView.builder(
                                        padding: const EdgeInsets.all(8),
                                        itemCount: snapshot.data.length,
                                        itemBuilder: (BuildContext context, int index) {
                                          return GestureDetector(
                                            onTap: () {
                                              String dirp = "/media/pi/PiTB/media/TVShows";
                                              String ap = dirp + snapshot.data[index]['tvfspath'];
                                              print(ap);
                                              final String apiPU = "http://192.168.0.42:8181/OmxplayerPlayMediaReact?medPath=${ap}";
                                              print(apiPU);
                                              playEpi(apiPU);
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              height: 50,
                                              color: Colors.amber[600],
                                              child: Center(
                                                child: Text(
                                                  '${snapshot.data[index]['title']}',
                                                  style: TextStyle(fontSize: 32, color: Colors.black),
                                                ),
                                              ),
                                            )
                                          );
                                        }
                                      );
                                    } else {
                                      return Text("OOOOOOOH FUCK");
                                    }
                                    return CircularProgressIndicator();
                                  }
                                ),
                            ))

                          );
                    }));
                    }),
                     const SizedBox(width: 12),
                    TextButton(
                      child: const Text('Season 3'),
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(fontSize: 32)
                      ),
                      onPressed: () {
                         Navigator.push(context,
                          MaterialPageRoute<void>(builder: (BuildContext context) {
                            return Scaffold(
                              appBar: AppBar(
                                title: Text("LostInSpace"),
                                backgroundColor: Colors.lightGreen[900],
                              ),
                              body: Container(
                              decoration: BoxDecoration(
                                color: Colors.lightGreenAccent.shade400,
                              ),
                              
                              child: Center(
                                child: FutureBuilder<List<dynamic>>(
                                  future: fetchLostInSpaceSeason2(),
                                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                                    if(snapshot.hasData){
                                      print(snapshot.data[0]['tvfspath']);
                                      return ListView.builder(
                                        padding: const EdgeInsets.all(8),
                                        itemCount: snapshot.data.length,
                                        itemBuilder: (BuildContext context, int index) {
                                          return GestureDetector(
                                            onTap: () {
                                              String dirp = "/media/pi/PiTB/media/TVShows";
                                              String ap = dirp + snapshot.data[index]['tvfspath'];
                                              print(ap);
                                              final String apiPU = "http://192.168.0.42:8181/OmxplayerPlayMediaReact?medPath=${ap}";
                                              print(apiPU);
                                              playEpi(apiPU);
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              height: 50,
                                              color: Colors.amber[600],
                                              child: Center(
                                                child: Text(
                                                  '${snapshot.data[index]['title']}',
                                                  style: TextStyle(fontSize: 32, color: Colors.black),
                                                ),
                                              ),
                                            )
                                          );
                                        }
                                      );
                                    } else if (snapshot.hasError) {
                                      return Text("${snapshot.error}");
                                    }
                                    return CircularProgressIndicator();
                                  }
                                ),
                            ))

                          );
                    }));
                    })
                    // TextButton(
                    //   child: const Text('Season 1'),
                    //   style: TextButton.styleFrom(
                    //     textStyle: TextStyle(fontSize: 32, color: Colors.white)
                    //   ),
                    //   onPressed: () {
                    //     Navigator.push(context,
                    //       MaterialPageRoute<void>(builder: (BuildContext context) {
                    //         return Scaffold(
                    //           appBar: AppBar(
                    //             title: Text("Lost In Space"),
                    //             backgroundColor: Colors.lightGreen[900],
                    //           ),
                    //           body: const Center(
                    //             child: Text(
                    //               'This is Lost In Space episode list',
                    //               style: TextStyle(fontSize: 24),
                    //             ),
                    //           ),
                    //         );
                    //       }
                    //     ));
                    //   },
                    // ),
                    // const SizedBox(width: 12),
                    // TextButton(
                    //   child: const Text('Season 2'),
                    //   style: TextButton.styleFrom(
                    //     textStyle: TextStyle(fontSize: 32)
                    //   ),
                    //   onPressed: () {
                    //     Navigator.push(context,
                    //       MaterialPageRoute<void>(builder: (BuildContext context) {
                    //         return Scaffold(
                    //           appBar: AppBar(
                    //             title: Text("Lost In Space"),
                    //             backgroundColor: Colors.lightGreen[900],
                    //           ),
                    //           body: const Center(
                    //             child: Text(
                    //               'This is Lost In Space episode list',
                    //               style: TextStyle(fontSize: 24),
                    //             ),
                    //           ),
                    //         );
                    //       }
                    //     ));
                    //   },
                    // ),
                    // const SizedBox(width: 12),
                  ]
                ))),
              ]),
            )
        ),
      )
    );

  }
}