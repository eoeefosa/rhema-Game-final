class Song {
  final String filename;
  final String name;
  final String? artist;

  const Song(this.filename, this.name, {this.artist});

  @override
  String toString() =>
      'Song(filename: $filename, name: $name, artist: $artist)';
}

const Set<Song> songs = {
  // Filenames with whitespace break package:audioplayers on iOS
  // (as of February 2022), so we use no whitespace.
  Song('music/Mr_Smith-Azul.mp3', 'Azul', artist: 'Mr Smith'),
  // Dont like
  Song('music/Mr_Smith-Sonorus.mp3', 'Sonorus', artist: 'Mr Smith'),
  Song('music/Mr_Smith-Sunday_Solitude.mp3', 'SundaySolitude',
      artist: 'Mr Smith'),
  Song('music/Mr_Smith-This_Could_Get_Dark.mp3', 'This Could Get Dark',
      artist: 'Mr Smith'),
  Song('music/kidsound.mp3', 'kid Sound', artist: 'NCS'),
  Song('music/happysound.mp3', 'Happy sound', artist: 'NCS'),
  Song('music/Mr_Smith-The_Mariachi.mp3', 'Mr Smith The Mariachi',
      artist: 'Mr Smith')
};
