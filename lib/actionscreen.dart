import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ActionScreen extends StatelessWidget{

  final String apiUrl = "http://192.168.0.91:9999/intAction";

  Future<List<dynamic>> fetchMovies() async {

    var result = await http.get(Uri.parse(apiUrl));
    return json.decode(result.body);

  }

  // String _movpath(dynamic mov){
  //   return mov['movfspath'];

  // }

  String _thumb(dynamic mov){
    return mov['httpthumbpath'];
  }

  // String _catagory(dynamic mov){
  //   return mov['catagory'];
  // }

  

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Mov List'),
  //     ),


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
                      
                      // Image.asset(
                      //   'images/two.jpg',
                      //   height: 250.0,
                      //   width: 250.0,
                      // )
                    )
                  );
                }
              );
              // return ListView.builder(
              //     padding: EdgeInsets.all(8),
              //     itemCount: snapshot.data.length,
              //     itemBuilder: (BuildContext context, int index){
              //       return
              //         Card(
              //           child: Column(
              //             children: <Widget>[
              //               ListTile(
              //                 leading: CircleAvatar(
              //                   radius: 30,
              //                   backgroundImage: NetworkImage(_thumb(snapshot.data[index]))),
              //                 title: Text(_movpath(snapshot.data[index])),
              //                 subtitle: Text('fuckme once'),
              //                 trailing: Text('fukcme twice'),
              //               )
              //             ],
              //           ),
              //         );
              //     });
            }else {
              return Center(child: CircularProgressIndicator());
            }
          },


        ),
      ),
    );
  }

}


// class ActionScreen extends StatelessWidget {
  

  // @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.lightGreen[900],
//         title: Text(
//           "Movies",
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           color: Colors.lightGreenAccent.shade400,
//         ),
//         child: testGridView,
//       )
//     );
//   }
// }

// Widget testGridView = GridView.builder(
//   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//     maxCrossAxisExtent: 200,
//     childAspectRatio: 3 / 2,
//     crossAxisSpacing: 20,
//     mainAxisSpacing: 20,
//   ),
//   itemCount: 25,
//   itemBuilder: (BuildContext context, index) {
//     return Container(
//       padding: const EdgeInsets.all(8),
//       child: GestureDetector(
//         onTap: () {
//           Navigator.pop(context);
//         },
//         child: Image.asset(
//           'images/two.jpg',
//           height: 250.0,
//           width: 250.0,
//         )
//       )
//     );
//   }
// );

// Widget listViewHomeZ = ListView.builder(
//   itemCount: 18,
//   itemBuilder: (BuildContext context, int index) {
//     return Card(
//       color: Colors.amber[400],
//       child: ListTile(
//         title: Text("Mexican Black Bird"),
//         subtitle: Text('Fandango'),
//         leading:
//             Image.asset('images/two2.jpg', height: 250.0, width: 200.0),
//         trailing: Text("13"),
//         onTap: () {
//           Navigator.pop(context);
//         }
//       ),
//     );
//   }
// );


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