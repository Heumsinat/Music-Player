import 'package:flutter/material.dart';

    class NewAlbum extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'New Album',
          theme: ThemeData(
            primarySwatch: Colors.teal,
          ),
          home: Scaffold(
            appBar: AppBar(title: Text('New Album')),
            body: BodyLayout(),
          ),
        );
      }
    }

    class BodyLayout extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return _myListView(context);
      }
    }

    // replace this function with the code in the examples
    Widget _myListView(BuildContext context) {
      return ListView(
        children: <Widget>[
          ListTile(
            leading:  Image.asset("assets/logo.png"),
            title: Text('Album 1'),
          ),
          ListTile(
            leading: Image.asset("assets/music1.jpg"),
            title: Text('Album 2'),
          ),
          ListTile(
            leading:  Image.asset("assets/logo.png"),
            title: Text('Album 3'),
          ),
          ListTile(
            leading: Image.asset("assets/music1.jpg"),
            title: Text('Album 4'),
          ),
          ListTile(
            leading:  Image.asset("assets/logo.png"),
            title: Text('Album 5'),
          ),
          ListTile(
            leading: Image.asset("assets/music1.jpg"),
            title: Text('Album 6'),
          ),
          ListTile(
            leading: Image.asset("assets/logo.png"),
            title: Text('Album 7'),
          ),
          ListTile(
            leading: Image.asset("assets/music1.jpg"),
            title: Text('Album 8'),
          ),

        ],
      );
    }