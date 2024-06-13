class Artist {
  final String imageUrl;
  final String name;

  Artist({required this.imageUrl, required this.name});
}

class ArtistPlayList {
  final int id;
  final String SongimageUrl;
  final String SongName;
  final String Album;
  final String Audio;

  ArtistPlayList({
    required this.id,
    required this.SongimageUrl,
    required this.SongName,
    required this.Album,
    required this.Audio,
  });
}
