import 'package:flutter/material.dart';

class TvShowsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TVShows"),
        backgroundColor: Colors.lightGreen[900],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.lightGreenAccent.shade400,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Viewing playlist page'),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.lightGreen),
                ),
                child: Text('Pop!'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      )
    );  
  }
}



