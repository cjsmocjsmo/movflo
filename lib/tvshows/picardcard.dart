import 'package:flutter/material.dart';

void picardNav(context) {
  // Navigator.pushNamed(context, '/MyStatefulWidget');
  Navigator.pushNamed(context, '/Junk');
}

class PicardCard extends StatelessWidget {
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
                  'images/picard.jpg',
                  fit: BoxFit.contain,
                    height: 355.5,
                    width: 200.0,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 80.0, 0.0, 0.0),

                  child: Column(
                  children: <Widget>[
                    TextButton(
                      child: const Text('Season 1'),
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(fontSize: 32, color: Colors.white)
                      ),
                      onPressed: () {
                        picardNav(context);
                      },
                    ),
                    const SizedBox(width: 12),
                    TextButton(
                      child: const Text('Season 2'),
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(fontSize: 32)
                      ),
                      onPressed: () {
                        picardNav(context);
                      },
                    ),
                    const SizedBox(width: 12),
                    // TextButton(
                    //   child: const Text('Season 3'),
                    //   style: TextButton.styleFrom(
                    //     textStyle: TextStyle(fontSize: 32)
                    //   ),
                    //   onPressed: () {
                    //     picardNav(context);
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