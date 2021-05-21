import 'package:flutter/material.dart';

class MovieScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Movflo",
          style: TextStyle(color: Colors.white),
          backgroundColor: Colors.lightGreen[900],
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
    childAspectRatio: 3/2,
    crossAxisSpacing: 20,
    mainAxisSpacing: 20,
  ),
  itemCount: 25,
  itemBuilder: (BuildContext context, index) {
    return Container(
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context),
              // Navigator.pushNamed(
              //   context,
              //   '/Playlists',
              //   arguments: {}
              // );
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
          leading: Image.asset('images/two2.jpg', height: 250.0, width: 200.0),
          trailing: Text("13"),
          onTap: () {
            Navigator.pop(context);
            // Navigator.pushNamed(
            //   context,
            //   '/Playlists',
            //   arguments: {}
            // );
          }
        ),
    );
  }
);