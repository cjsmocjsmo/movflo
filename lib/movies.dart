import 'package:flutter/material.dart';

class MoviesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Movflo",
          style: TextStyle(color: Colors.white),
        ),
        
        actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/Songs'
                );
              },
              icon: Icon(Icons.album_sharp),
              tooltip: "Go to Songs Page"
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/Playlists'
                );
              },
              icon: Icon(Icons.add_rounded),
              tooltip: "Go To Playlist Page"
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/'
                );
              },
              icon: Icon(Icons.exit_to_app_sharp),
              tooltip: "Exit App"
            ),
            IconButton(
              icon: const Icon(Icons.add_alert),
              tooltip: 'Show Snackbar',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('ZZ Top \n Fandango \n Mexican Black Bird'),
                  backgroundColor: Colors.purple,
                ));
              },
            ),
          ]
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.lightGreenAccent.shade400,
          ),
          // child: Center(
            // child:listViewHomeZ,
          child: testGridView,
          // ),
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
              Navigator.pushNamed(
                context,
                '/Playlists',
                arguments: {}
              );
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