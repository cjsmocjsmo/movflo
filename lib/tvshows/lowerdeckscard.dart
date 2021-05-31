import 'package:flutter/material.dart';

void lowerDecksNav(context) {
  Navigator.pushNamed(context, '/MyStatefulWidget');
}

class LowerDecksCard extends StatelessWidget {
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
                  'images/lowerdecks.jpg',
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
                        lowerDecksNav(context);
                      },
                    ),
                    const SizedBox(width: 12),
                    TextButton(
                      child: const Text('Season 2'),
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(fontSize: 32)
                      ),
                      onPressed: () {
                        lowerDecksNav(context);
                      },
                    ),
                    const SizedBox(width: 12),
                    // TextButton(
                    //   child: const Text('Season 3'),
                    //   style: TextButton.styleFrom(
                    //     textStyle: TextStyle(fontSize: 32)
                    //   ),
                    //   onPressed: () {
                    //     starTrekNav(context);
                    //   },
                    // ),
                    // const SizedBox(width: 12),
                    // TextButton(
                    //   child: const Text('Season 4'),
                    //   style: TextButton.styleFrom(
                    //     textStyle: TextStyle(fontSize: 32)
                    //   ),
                    //   onPressed: () {
                    //     starTrekNav(context);
                    //   },
                    // ),
                    // const SizedBox(width: 12),
                    // TextButton(
                    //   child: const Text('Season 5'),
                    //   style: TextButton.styleFrom(
                    //     textStyle: TextStyle(fontSize: 32)
                    //   ),
                    //   onPressed: () {
                    //     starTrekNav(context);
                    //   },
                    // ),
                    // const SizedBox(width: 12),
                    // TextButton(
                    //   child: const Text('Season 6'),
                    //   style: TextButton.styleFrom(
                    //     textStyle: TextStyle(fontSize: 32)
                    //   ),
                    //   onPressed: () {
                    //     starTrekNav(context);
                    //   },
                    // ),
                    // const SizedBox(width: 12),
                    // TextButton(
                    //   child: const Text('Season 7'),
                    //   style: TextButton.styleFrom(
                    //     textStyle: TextStyle(fontSize: 32)
                    //   ),
                    //   onPressed: () {
                    //     starTrekNav(context);
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