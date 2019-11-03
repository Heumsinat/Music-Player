import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  //  final int index;
  // Settings(this.index);
  @override
  Widget build(BuildContext context) {
    return 
      CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Singer 1'),
                  color: Colors.green[100],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Singer 2'),
                  color: Colors.green[200],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Singer 3'),
                  color: Colors.green[300],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Singer 4'),
                  color: Colors.green[400],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Singer 5'),
                  color: Colors.green[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Singer 6'),
                  color: Colors.green[600],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Singer 7'),
                  color: Colors.green[700],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Singer 8'),
                  color: Colors.green[800],
                ),
              ],
            ),
          ),
        ],
    );
  }
}