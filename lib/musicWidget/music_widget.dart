import 'package:flutter/material.dart';
import 'package:music_player/data/song_data.dart';

class MusicInherited extends InheritedWidget {

  final SongData songData;
  final bool isLoading;

  const MusicInherited(this.songData, this.isLoading, {
    Key key,
    @required Widget child,
  })
      : assert(child != null),
        super(key: key, child: child);

  static MusicInherited of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(MusicInherited) as MusicInherited;
  }

  @override
  bool updateShouldNotify(MusicInherited old) {
    return (songData!=old.songData || isLoading != old.isLoading);
  }
}