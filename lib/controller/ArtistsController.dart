import 'package:flutter/material.dart';
import 'package:own_music/modal/ArtistsModal.dart';

class ArtistsController extends ChangeNotifier {}

List<Artist> artists = [
  Artist(
    imageUrl:
        "https://a10.gaanacdn.com/gn_img/artists/Dk9KNk23Bx/k9KNqJJbBx/size_m_1716815348.webp",
    name: "Arijit Singh",
  ),
  Artist(
    imageUrl:
        "https://a10.gaanacdn.com/gn_img/artists/zLp36PvbrG/Lp36AR0KrG/size_m_1716815534.webp",
    name: "Pritam",
  ),
  Artist(
    imageUrl:
        "https://a10.gaanacdn.com/gn_img/artists/9MAWe7KyJe/MAWe9lBGWy/size_m_1716892787.webp",
    name: "Badshah",
  ),
  Artist(
    imageUrl:
        "https://a10.gaanacdn.com/gn_img/artists/Rz4W87v3xD/Rz4W8ppWxD/size_m_1716893509.webp",
    name: "Neha Kakkar",
  ),
  Artist(
    imageUrl:
        "https://a10.gaanacdn.com/gn_img/artists/6Zxb2r7b9w/Zxb2xp0w39/size_m.jpg",
    name: "B Praak",
  ),
  Artist(
    imageUrl:
        "https://a10.gaanacdn.com/gn_img/artists/10q3ZR1352/0q3Z6Lg135/size_m_1716892887.webp",
    name: "Jubin Nautiyal",
  ),
  Artist(
    imageUrl:
        "https://a10.gaanacdn.com/gn_img/artists/Dk9KNk23Bx/k9KNgP763B/size_m_1595857138.webp",
    name: "Tony Kakkar",
  ),
  Artist(
    imageUrl:
        "https://a10.gaanacdn.com/gn_img/artists/w4MKPDOKoj/4MKPgoQgbo/size_m_1516802409.webp",
    name: "Yo Yo Honey Singh",
  ),
  Artist(
    imageUrl:
        "https://a10.gaanacdn.com/gn_img/artists/21GWwrR3pk/1GWwYz4DKp/size_m_1567610470.webp",
    name: "Tanishk Bagchi",
  ),
];

// Add more playlists for other artists
final Map<String, List<ArtistPlayList>> playlists = {
  'Arijit Singh': ArijitSinghPlaylist,
  // Add other playlists here
};

final List<ArtistPlayList> ArijitSinghPlaylist = [
  ArtistPlayList(
    id: 1,
    SongimageUrl:
        "https://a10.gaanacdn.com/gn_img/albums/w4MKPObojg/MKPDB1YAKo/size_l.jpg",
    SongName: "O Maahi",
    Album: "Dunki",
    Audio:
        "https://pagalfree.com/musics/128-O%20Maahi%20-%20Dunki%20128%20Kbps.mp3",
  ),
  ArtistPlayList(
    id: 2,
    SongimageUrl:
        "https://a10.gaanacdn.com/gn_img/albums/Rz4W8vKxD5/4W87PAOO3x/size_l.jpg",
    SongName: "Satranga",
    Album: "Animal",
    Audio:
        "https://pagalfree.com/musics/128-Satranga%20-%20Animal%20128%20Kbps.mp3",
  ),
  ArtistPlayList(
    id: 3,
    SongimageUrl:
        "https://a10.gaanacdn.com/gn_img/albums/4Z9bqo3yQn/9bqZ41LXKy/size_l.jpg",
    SongName: "Phir Aur Kya Chahiye",
    Album: "Zara Hatke Zara Bachke",
    Audio:
        "https://pagalfree.com/musics/128-Phir%20Aur%20Kya%20Chahiye%20-%20Arijit%20Singh%20128%20Kbps.mp3",
  ),
  ArtistPlayList(
    id: 4,
    SongimageUrl:
        "https://a10.gaanacdn.com/gn_img/albums/D0PKLrWGl9/0PKLDnzwKG/size_l_1581694054.webp",
    SongName: "Shayad",
    Album: "Love Aaj Kal",
    Audio:
        "https://pagalfree.com/musics/192-Shayad%20-%20Love%20Aaj%20Kal%20192%20Kbps.mp3",
  ),
  ArtistPlayList(
    id: 5,
    SongimageUrl:
        "https://a10.gaanacdn.com/gn_img/albums/ZaP37RKDy7/P37O6Rql3D/size_l.jpg",
    SongName: "Heeriye",
    Album: "Heeriye",
    Audio:
        "https://pagalfree.com/musics/128-Heeriye%20(feat.%20Arijit%20Singh)%20-%20Dulquer%20Salmaan%20128%20Kbps.mp3",
  ),ArtistPlayList(
    id: 6,
    SongimageUrl:
        "https://a10.gaanacdn.com/gn_img/albums/ZaP37RKDy7/P37O6Rql3D/size_l.jpg",
    SongName: "Heeriye",
    Album: "Heeriye",
    Audio:
        "https://pagalfree.com/musics/128-Heeriye%20(feat.%20Arijit%20Singh)%20-%20Dulquer%20Salmaan%20128%20Kbps.mp3",
  ),
];
