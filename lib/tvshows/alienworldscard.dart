import 'package:flutter/material.dart';

void alienWorldsNav(context) {
  Navigator.pushNamed(context, '/Junk');
}

class AlienWorldsCard extends StatelessWidget {
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
                  'images/alienworlds.jpg',
                  fit: BoxFit.contain,
                    height: 355.5,
                    width: 200.0,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),

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
                                title: Text("Alien Worlds"),
                                backgroundColor: Colors.lightGreen[900],
                              ),
                              body: const Center(
                                child: Text(
                                  'This is alien worlds episode list',
                                  style: TextStyle(fontSize: 24),
                                ),
                              ),
                            );
                          }
                        ));
                      },
                    ),
                    const SizedBox(width: 12),
                  ]
                ))),
              ]),
            )
        ),
      )
    );

  }
}