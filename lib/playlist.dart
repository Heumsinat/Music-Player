import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/musicWidget/music_widget.dart';
import 'package:music_player/data/song_data.dart';
import 'dart:io';
import 'package:music_player/Pages/playing_page.dart';

class Playlist extends StatefulWidget {
  @override
  _PlaylistState createState() => _PlaylistState();
}
class _PlaylistState extends State<Playlist> {
  SongData songData;
  bool _isLoading;

  @override
  void initState() {
    super.initState();
    loadSongs();
  }

  void loadSongs() async{
    _isLoading = true;
    List<Song> songs;
    print("Loading Songs");
    try{
      songs = await MusicFinder.allSongs();
      print("get song successful!");
    }catch(e){
      print("Error!Cannot get fetch Songs");
    }

    if(!mounted)
      return;

    songs.sort((a,b) => (a.title.compareTo(b.title)));

    setState(() {
      songData = SongData(songs);
      _isLoading = false;
    });
  }
   @override
  Widget build(BuildContext context) {
    return MusicInherited(songData,_isLoading,child: HomePage(),);
  }
 
}
class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final inherited = MusicInherited.of(context);
    SongData songData = inherited.songData;
    return Scaffold(
      body: inherited.isLoading?
            Center(child:CircularProgressIndicator()):
            ListView.builder(
                itemCount: songData.songs.length,
                itemBuilder: (context,index) {
                  var s = songData.songs[index];
                  return ListTile(
                      leading: Hero(
                        tag: s.title,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: SizedBox(
                            height: 50.0,
                            width: 50.0,
                            child: s.albumArt!=null?
                                    Image.file(File.fromUri(Uri.parse(s.albumArt)),fit: BoxFit.cover,):
                                    Icon(Icons.music_note),
                          ),
                        ),
                      ),
                      title: Text(s.title),
                      subtitle: Text(s.artist),
                    onTap: (){
                        songData.setCurrentIndex(index);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => PlayingPage(song: s,songData: songData)
                        ));
                    },
                  );
                }
            ),
    );
  }
}