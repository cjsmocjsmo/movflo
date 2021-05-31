import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  int _selectedIndex2 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[900],
        title: Text(
          "XMen",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.lightGreen[400],
        ),
      //  child: ListView(
        child: Row(
        children: <Widget>[
          
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.selected,
            backgroundColor: Colors.lightGreenAccent.shade400,
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.login),
                selectedIcon: Icon(Icons.login),
                label: Text('Season 1'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.login),
                selectedIcon: Icon(Icons.login),
                label: Text('Seson 2'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.login),
                selectedIcon: Icon(Icons.login),
                label: Text('Seson 3'),
              ),
            ]),
            NavigationRail(
            selectedIndex: _selectedIndex2,
            onDestinationSelected: (int index2) {
              setState(() {
                _selectedIndex2 = index2;
              });
            },
            labelType: NavigationRailLabelType.selected,
            backgroundColor: Colors.lightGreenAccent.shade400,
            destinations: const <NavigationRailDestination>[




              NavigationRailDestination(
                icon: Icon(Icons.login),
                selectedIcon: Icon(Icons.login),
                label: Text('Seson 4'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.login),
                selectedIcon: Icon(Icons.login),
                label: Text('Seson 5'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.login),
                selectedIcon: Icon(Icons.login),
                label: Text('Seson 6'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.login),
                selectedIcon: Icon(Icons.login),
                label: Text('Season 7'),
              ),
            ],
          ),
        
          const VerticalDivider(thickness: 1, width: 1),
          // This is the main content.
          Expanded(
            child: Center(
              child: Text('selectedIndex: $_selectedIndex $_selectedIndex2'),
            ),
          )
          
        ],
      // ),
    )));
  }
}
