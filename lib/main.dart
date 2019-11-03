import 'package:flutter/material.dart';
import 'package:music_player/download.dart';
import 'package:music_player/my_app.dart';
import 'package:music_player/settings.dart';
import 'package:music_player/playlist.dart';
import 'package:music_player/Pages/new_album.dart';


void main() => runApp(MusicApp());

class MusicApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     title: 'My Flutter App',
     home: Home(),
   );
  }
}
class Home extends StatefulWidget {
 @override
 State<StatefulWidget> createState() {
    return _HomeState();
  }
}
class _HomeState extends State<Home> {
  int _currentIndex = 0;
  List<Widget> _pages = [
  MyApp(),
  Settings(),
  Playlist(),
  Download(),
  ];
 @override
 Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
      title: Text('Music App'),
    ),
    drawer: Drawer(child: MyDrawer()), //Menu interface
    body: _pages[_currentIndex], // new
    bottomNavigationBar: BottomNavigationBar(
      onTap: onItemTapped, // new
      currentIndex: _currentIndex,
      selectedItemColor: Colors.lightBlue,
      unselectedItemColor: Colors.grey,
      items: [
        new BottomNavigationBarItem(
          icon: Icon(Icons.music_note),
          title: Text('Songs'),
        ),
        new BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          title: Text('Singer'),
        ),
        new BottomNavigationBarItem(
          icon: Icon(Icons.queue_music),
          title: Text('Playlist')
        ),
        new BottomNavigationBarItem(
          icon: Icon(Icons.file_download),
          title: Text('Download')
        )
       ],
     ),
   );
 }
 void onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
          return ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Image.asset("assets/music1.jpg"),
                        radius: 50.0,
                      ),
                    ),
                  ],
                ),
                padding: EdgeInsets.only(top: 35.0, left: 20.0),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('New Album'),
                leading: Icon(Icons.collections),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NewAlbum()));
                },
              ),
              ListTile(
                title: Text('Production'),
                leading: Icon(Icons.library_music),
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => Production()));
                },
              ),
              ListTile(
                title: Text('Song Request'),
                leading: Icon(Icons.queue ),
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => SongRequest()));
                },
              ),
            ],
          );
      },
    );
  }
}
