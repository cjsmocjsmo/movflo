import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EnterpriseCard extends StatelessWidget {
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
                  'images/enterprise.webp',
                  fit: BoxFit.contain,
                  height: 355.5,
                  width: 200.0,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
                    child: Column(
                      children: <Widget>[
                        _enterpriseSeasons(context, "1"),
                        _enterpriseSeasons(context, "2"),
                        _enterpriseSeasons(context, "3"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

_enterpriseSeasons(BuildContext context, String snum) {
  return Padding(
    padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
    child: SizedBox.fromSize(
      size: Size(66, 66), // button width and height
      child: ClipOval(
        child: Material(
          color: Colors.lightGreenAccent.shade400, //amber[400], // button color
          child: InkWell(
            splashColor: Colors.green, // splash color
            onTap: () {
              _enterprise(context, snum);
            }, // button pressed
            child: _enterpriseButtonColumn(snum),
          ),
        ),
      ),
    ),
  );
}

Future<void> playEpi(playURL) async {
  try {
    var resultPlay = await http.get(Uri.parse(playURL));
    return json.decode(resultPlay.body);
  } catch (e) {
    print(e);
  }
}

_enterprise(BuildContext context, String seasonNum) {
  Future<List<dynamic>> fetchEnterpriseSeason1() async {
    final String api1Url = "http://192.168.0.94:8888/Enterprise?season=01";
    final String api2Url = "http://192.168.0.94:8888/Enterprise?season=02";
    final String api3Url = "http://192.168.0.94:8888/Enterprise?season=03";
    if (seasonNum == '1') {
      var result = await http.get(Uri.parse(api1Url));
      return json.decode(result.body);
    } else if (seasonNum == '2') {
      var result = await http.get(Uri.parse(api2Url));
      return json.decode(result.body);
    } else {
      var result = await http.get(Uri.parse(api3Url));
      return json.decode(result.body);
    }
  }

  return Navigator.push(
    context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Enterprise"),
            backgroundColor: Colors.lightGreen[900],
          ),
          body: Container(
            decoration: BoxDecoration(
              color: Colors.lightGreenAccent.shade400,
            ),
            child: Center(
              child: FutureBuilder<List<dynamic>>(
                future: fetchEnterpriseSeason1(),
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
                                    fontSize: 32, color: Colors.black),
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
              ),
            ),
          ),
        );
      },
    ),
  );
}

_enterpriseButtonColumn(String episode) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        episode,
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
