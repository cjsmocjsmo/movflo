import 'package:flutter/material.dart';

class JunkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Junk"),
        backgroundColor: Colors.lightGreen[900],
        actions: [

          IconButton(
            icon: const Icon(Icons.view_sidebar),
            // label: Text("Seasons"),
            tooltip: "Go to next page",
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute<void>(builder: (BuildContext context) {
                return Scaffold(
                  appBar: AppBar(title: const Text('Next Page')),
                  body: const Center(
                    child: Text(
                      'This is the next page',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                );
              }));
          })
        ]
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.lightGreenAccent.shade400,
        ),
        child: Center(
          child: Image.network(
            // _thumb(snapshot.data[index]),
            "images/four.jpg",
            fit: BoxFit.cover,
              // height: 300.0,
              // width: 175.0,
          ),
        ),
      ),      
    );
  }
}

            // ElevatedButton(
          //             // child: Text("Season 4"),
          //             child: Text(
          //               "Season 1",
          //               style: TextStyle(
          //                 fontSize: 20,
          //                 fontStyle: FontStyle.italic,
          //                 //fontFamily: "alex",
          //               ),
          //             ),
          //             style: ElevatedButton.styleFrom(
          //               onPrimary: Colors.black,
          //               primary: Colors.purple,
          //               elevation: 10,
          //               minimumSize: Size(150,60),
          //               shadowColor: Colors.purple,
          //               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),
          //             )),
          //             onPressed: () {
          //               Navigator.pop(context);
          //             },
          //           ),

          //     ButtonBar(
          //       alignment: MainAxisAlignment.center,
          //       // buttonPadding:EdgeInsets.symmetric(
          //       //     horizontal: 30,
          //       //     vertical: 10
          //       // ),
          //       children: [
          //           ElevatedButton(
          //             // child: Text("Season 4"),
          //             child: Text(
          //               "Season 1",
          //               style: TextStyle(
          //                 fontSize: 20,
          //                 fontStyle: FontStyle.italic,
          //                 //fontFamily: "alex",
          //               ),
          //             ),
          //             style: ElevatedButton.styleFrom(
          //               onPrimary: Colors.black,
          //               primary: Colors.purple,
          //               elevation: 10,
          //               minimumSize: Size(150,60),
          //               shadowColor: Colors.purple,
          //               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),
          //             )),
          //             onPressed: () {
          //               Navigator.pop(context);
          //             },
          //           ),
          //           ElevatedButton(
          //             // child: Text("Season 4"),
          //             child: Text(
          //               "Season2",
          //               style: TextStyle(
          //                 fontSize: 20,
          //                 fontStyle: FontStyle.italic,
          //                 //fontFamily: "alex",
          //               ),
          //             ),
          //             style: ElevatedButton.styleFrom(
          //               onPrimary: Colors.black,
          //               primary: Colors.purple,
          //               elevation: 10,
          //               minimumSize: Size(150,60),
          //               shadowColor: Colors.purple,
          //               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),
          //             )),
          //             onPressed: () {
          //               Navigator.pop(context);
          //             },
          //           ),
          //           ElevatedButton(
          //             // child: Text("Season 4"),
          //             child: Text(
          //               "Season3",
          //               style: TextStyle(
          //                 fontSize: 20,
          //                 fontStyle: FontStyle.italic,
          //                 //fontFamily: "alex",
          //               ),
          //             ),
          //             style: ElevatedButton.styleFrom(
          //               onPrimary: Colors.black,
          //               primary: Colors.purple,
          //               elevation: 10,
          //               minimumSize: Size(150,60),
          //               shadowColor: Colors.purple,
          //               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),
          //             )),
          //             onPressed: () {
          //               Navigator.pop(context);
          //             },
          //           ),
          //           ElevatedButton(
          //             // child: Text("Season 4"),
          //             child: Text(
          //               "Season4",
          //               style: TextStyle(
          //                 fontSize: 20,
          //                 fontStyle: FontStyle.italic,
          //                 //fontFamily: "alex",
          //               ),
          //             ),
          //             style: ElevatedButton.styleFrom(
          //               onPrimary: Colors.black,
          //               primary: Colors.purple,
          //               elevation: 10,
          //               minimumSize: Size(150,60),
          //               shadowColor: Colors.purple,
          //               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),
          //             )),
          //             onPressed: () {
          //               Navigator.pop(context);
          //             },
          //           ),
          //     //   ],
          //     // ),



          //     // Text('Viewing playlist page'),
              
          //   ],
          // ),