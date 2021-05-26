import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ActionScreen extends StatelessWidget{

  final String apiUrl = "http://192.168.0.91:9999/intAction";

  Future<List<dynamic>> fetchMovies() async {

    var result = await http.get(Uri.parse(apiUrl));
    return json.decode(result.body);

  }

  String _thumb(dynamic mov){
    return mov['httpthumbpath'];
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
        child: FutureBuilder<List<dynamic>>(
          future: fetchMovies(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.hasData){
              print(snapshot.data);
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
                        Navigator.pop(context);
                      },
                      child: Image.network(
                        _thumb(snapshot.data[index]),
                        fit: BoxFit.cover,
                          // height: 340.0,
                          width: 500.0,
                        )
                    )
                  );
                }
              );
            }else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}