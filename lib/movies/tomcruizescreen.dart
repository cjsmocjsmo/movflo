import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//import 'package:transparent_image/transparent_image.dart';

class TomCruizeScreen extends StatelessWidget {
  final String apiUrl = "http://192.168.0.94:8888/TomCruize";

  Future<List<dynamic>> fetchMovies() async {
    var result = await http.get(Uri.parse(apiUrl));
    return json.decode(result.body);
  }

  String _thumb(dynamic mov) {
    return mov['httpthumbpath'];
  }

  String _movfspath(dynamic mov) {
    return mov['movfspath'];
  }

  Future<void> playMov(playURL) async {
    var resultPlay = await http.get(Uri.parse(playURL));
    return json.decode(resultPlay.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[900],
        title: Text(
          "Tom Cruize",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.lightGreenAccent.shade400,
        ),
        child: FutureBuilder<List<dynamic>>(
          future: fetchMovies(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 9 / 16,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                        padding: const EdgeInsets.all(8),
                        child: GestureDetector(
                            onTap: () {
                              final String ap =
                                  _movfspath(snapshot.data[index]);
                              final String apiPU =
                                  "http://192.168.0.94:8181/OmxplayerPlayMediaReact?medPath=" +
                                      ap;
                              print(apiPU);
                              final String apiPlayUrl = apiPU;

                              foo(apiPlayUrl);
                              Navigator.pop(context);
                            },
                            child: Image.network(
                              _thumb(snapshot.data[index]),
                              fit: BoxFit.contain,
                              height: 400.0,
                              width: 200.0,
                            )));
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  void foo(apath) async {
    final playaddr = await playMov(apath);
    return playaddr;
  }
}
