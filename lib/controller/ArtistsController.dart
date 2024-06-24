import 'package:flutter/material.dart';
import 'package:own_music/modal/ArtistsModal.dart';

ArtistsController artistsController = ArtistsController();

class ArtistsController {

  Future<List<ArtistPlayList>> getAllSongs() async {
    await Future.delayed(Duration(seconds: 2));
    return [
      ...ArijitSinghPlaylist,
      ...PritamPlaylist,
      ...BadshahPlaylist,
      ...NehaKakkarPlaylist,
      ...BPraakPlaylist,
      ...JubinNautiyalPlaylist,
      ...TonyKakkarPlaylist,
      ...TanishkBagchiPlaylist,
    ];
  }
}

List<ArtistPlayList> favoriteSongs = [];

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
        "https://a10.gaanacdn.com/gn_img/artists/21GWwrR3pk/1GWwYz4DKp/size_l_1717412444.webp",
    name: "Tanishk Bagchi",
  ),
];

// Add more playlists for other artists
Map<String, List<ArtistPlayList>> playlists = {
  'Arijit Singh': ArijitSinghPlaylist,
  'Pritam': PritamPlaylist,
  'Badshah': BadshahPlaylist,
  'Neha Kakkar': NehaKakkarPlaylist,
  'B Praak': BPraakPlaylist,
  'Jubin Nautiyal': JubinNautiyalPlaylist,
  'Tony Kakkar': TonyKakkarPlaylist,
  'Tanishk Bagchi': TanishkBagchiPlaylist,
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
  )
];
final List<ArtistPlayList> PritamPlaylist = [
  ArtistPlayList(
    id: 1,
    SongimageUrl:
        "https://a10.gaanacdn.com/gn_img/albums/oAJbDElKnL/oAJbDElKnL/size_m.webp",
    SongName: "Tum Se Hi",
    Album: "Jab We Met",
    Audio:
        "https://pagalfree.com/musics/128-Tum%20Se%20Hi%20-%20Jab%20We%20Met%20128%20Kbps.mp3",
  ),
  ArtistPlayList(
    id: 2,
    SongimageUrl:
        "https://a10.gaanacdn.com/gn_img/albums/ZaP37OR3Dy/aP37LpRWDy/size_m.webp",
    SongName: "Zara Sa",
    Album: "Jannat",
    Audio:
        "https://pagalfree.com/musics/128-Zara%20Sa%20-%20Jannat%20128%20Kbps.mp3",
  ),
  ArtistPlayList(
    id: 3,
    SongimageUrl:
        "https://a10.gaanacdn.com/gn_img/albums/koMWQ4B3qL/oMWQO5LXKq/size_m.webp",
    SongName: "Channa Mereya",
    Album: "Ae Dil Hai Mushkil",
    Audio:
        "https://pagalfree.com/musics/128-Channa%20Mereya%20-%20Ae%20Dil%20Hai%20Mushkil%20128%20Kbps.mp3",
  ),
  ArtistPlayList(
    id: 4,
    SongimageUrl:
        "https://a10.gaanacdn.com/gn_img/albums/9MAWe97WyJ/MAWeOnLqKy/size_m_1567516167.webp",
    SongName: "Khairiyat",
    Album: "Chhichhore",
    Audio:
        "https://pagalfree.com/musics/128-Khairiyat%20-%20Chhichhore%20128%20Kbps.mp3",
  ),
  ArtistPlayList(
    id: 5,
    SongimageUrl:
        "https://a10.gaanacdn.com/gn_img/albums/dwN39y83DP/wN395rE83D/size_m_1713881672.webp",
    SongName: "Pehli Nazar Mein",
    Album: "Race",
    Audio:
        "https://pagalfree.com/musics/128-Pehli%20Nazar%20Mein%20-%20Race%20128%20Kbps.mp3",
  )
];
final List<ArtistPlayList> BadshahPlaylist = [
  ArtistPlayList(
    id: 1,
    SongimageUrl:
        "https://a10.gaanacdn.com/gn_img/song/zLp36PvbrG/p36V17eG3r/size_m_1537454565.webp",
    SongName: "Akh Lad Jaave",
    Album: "Loveyatri",
    Audio:
        "https://pagalfree.com/musics/128-Akh%20Lad%20Jaave%20-%20Loveyatri%20-%20A%20Journey%20Of%20Love%20128%20Kbps.mp3",
  ),
  ArtistPlayList(
    id: 2,
    SongimageUrl:
        "https://a10.gaanacdn.com/gn_img/albums/a7LWBkzbzX/7LWBgE0kbz/size_m.webp",
    SongName: "Genda Phool",
    Album: "Genda Phool",
    Audio:
        "https://pagalfree.com/musics/128-Genda%20Phool%20-%20Badshah%20128%20Kbps.mp3",
  ),
  ArtistPlayList(
    id: 3,
    SongimageUrl:
        "https://a10.gaanacdn.com/gn_img/albums/jBr3gybR1m/r3geD21NbR/size_m.jpg",
    SongName: "Jagga Jatt",
    Album: "Jagga Jatt",
    Audio:
        "https://pagalfree.com/musics/128-Jagga%20Jatt%20-%20Diljit%20Dosanjh%20128%20Kbps.mp3",
  ),
  ArtistPlayList(
    id: 4,
    SongimageUrl:
        "https://a10.gaanacdn.com/gn_img/albums/oAJbDlbnL8/AJbDwBLjWn/size_l_1581589960.webp",
    SongName: "Garmi",
    Album: "Street Dancer 3D",
    Audio:
        "https://pagalfree.com/musics/128-Garmi%20feat.%20Varun%20Dhawan%20-%20Street%20Dancer%203D%20128%20Kbps.mp3",
  ),
  ArtistPlayList(
    id: 5,
    SongimageUrl:
        "https://a10.gaanacdn.com/gn_img/albums/jBr3gybR1m/Br3gYR1YbR/size_l_1564137358.webp",
    SongName: "Sheher Ki Ladki",
    Album: "Khandaani Shafakhana",
    Audio:
        "https://pagalfree.com/musics/128-Sheher%20Ki%20Ladki%20-%20Khandaani%20Shafakhana%20128%20Kbps.mp3",
  )
];
final List<ArtistPlayList> NehaKakkarPlaylist = [
  ArtistPlayList(
    id: 1,
    SongimageUrl:
        "https://a10.gaanacdn.com/gn_img/albums/21GWwrR3pk/1GWwlegLbp/size_l.webp",
    SongName: "Yaad Piya Ki Aane Lagi",
    Album: "Yaad Piya Ki Aane Lagi",
    Audio:
        "https://pagalfree.com/musics/128-Yaad%20Piya%20Ki%20Aane%20Lagi%20-%20Neha%20Kakkar,%20Tanishk%20Bagchi%20128%20Kbps.mp3",
  ),
  ArtistPlayList(
    id: 2,
    SongimageUrl:
        "https://pagalfree.com/images/128Dil%20Ko%20Karaar%20Aaya%20(Reprise)%20-%20Neha%20Kakkar%20128%20Kbps.jpg",
    SongName: "Dil Ko Karaar Aaya",
    Album: "Dil Ko Karaar Aaya",
    Audio:
        "https://pagalfree.com/musics/128-Dil%20Ko%20Karaar%20Aaya%20(Reprise)%20-%20Neha%20Kakkar%20128%20Kbps.mp3",
  ),
  ArtistPlayList(
    id: 3,
    SongimageUrl:
        "https://a10.gaanacdn.com/gn_img/albums/koMWQ7BKqL/oMWQ8VDX3q/size_l_1586232677.webp",
    SongName: "Tu Hi Yaar Mera",
    Album: "Pati Patni Aur Woh",
    Audio:
        "https://pagalfree.com/musics/128-Tu%20Hi%20Yaar%20Mera%20-%20Pati%20Patni%20Aur%20Woh%20128%20Kbps.mp3",
  ),
  ArtistPlayList(
    id: 4,
    SongimageUrl:
        "https://a10.gaanacdn.com/gn_img/albums/0wrb4kNWLg/wrb476lyWL/size_l.webp",
    SongName: "Taaron Ke Shehar",
    Album: "Taaron Ke Shehar",
    Audio:
        "https://pagalfree.com/musics/128-Taaron%20Ke%20Shehar%20-%20Neha%20Kakkar%20128%20Kbps.mp3",
  ),
  ArtistPlayList(
    id: 5,
    SongimageUrl:
        "https://a10.gaanacdn.com/gn_img/song/Oxd3xP3gVY/d3xAXYnaWg/size_m_1563172659.webp",
    SongName: "O Saki Saki",
    Album: "Batla House",
    Audio:
        "https://pagalfree.com/musics/128-O%20Saki%20Saki%20-%20Batla%20House%20128%20Kbps.mp3",
  )
];
final List<ArtistPlayList> BPraakPlaylist = [
  ArtistPlayList(
    id: 1,
    SongimageUrl:
        "https://a10.gaanacdn.com/gn_img/albums/21GWwrR3pk/GWwrkM6z3p/size_l_1619031569.webp",
    SongName: "Baarish Ki Jaaye",
    Album: "Baarish Ki Jaaye",
    Audio:
        "https://pagalfree.com/musics/128-Baarish%20Ki%20Jaaye%20-%20B%20Praak%20128%20Kbps.mp3",
  ),
  ArtistPlayList(
    id: 2,
    SongimageUrl:
        "https://a10.gaanacdn.com/gn_img/albums/Dk9KNk23Bx/k9KNAaDqbB/size_l_1585634450.webp",
    SongName: "Pachtaoge",
    Album: "Pachtaoge",
    Audio:
        "https://pagalfree.com/musics/128-Pachtaoge%20-%20Female%20Version%20128%20Kbps.mp3",
  ),
  ArtistPlayList(
    id: 3,
    SongimageUrl:
        "https://a10.gaanacdn.com/gn_img/song/XYybzNrb2g/ybzEg61rW2/size_m_1628084846.webp",
    SongName: "Ranjha",
    Album: "Shershaah",
    Audio:
        "https://pagalfree.com/musics/128-Ranjha%20-%20Shershaah%20128%20Kbps.mp3",
  ),
  ArtistPlayList(
    id: 4,
    SongimageUrl:
        "https://a10.gaanacdn.com/gn_img/song/7rVW1Rbk56/VW1L7Rxg3k/size_m_1628958702.webp",
    SongName: "Mann Bharryaa 2.0",
    Album: "Shershaah",
    Audio:
        "https://pagalfree.com/musics/128-Mann%20Bharryaa%202.0%20-%20Shershaah%20128%20Kbps.mp3",
  ),
  ArtistPlayList(
    id: 5,
    SongimageUrl:
        "https://a10.gaanacdn.com/gn_img/albums/81l3Me3rMx/1l3MYe7e3r/size_l.webp",
    SongName: "Dil Tod Ke",
    Album: "Dil Tod Ke",
    Audio:
        "https://pagalfree.com/musics/128-Dil%20Tod%20Ke%20-%20B%20Praak%20128%20Kbps.mp3",
  )
];
final List<ArtistPlayList> JubinNautiyalPlaylist = [
  ArtistPlayList(
    id: 1,
    SongimageUrl:
        "https://a10.gaanacdn.com/gn_img/song/6Zxb2r7b9w/xb2jvG6Gb9/size_m_1570080954.webp",
    SongName: "Tum Hi Aana",
    Album: "Marjaavaan",
    Audio:
        "https://pagalfree.com/musics/128-Tum%20Hi%20Aana%20-%20Marjaavaan%20128%20Kbps.mp3",
  ),
  ArtistPlayList(
    id: 2,
    SongimageUrl:
        "https://a10.gaanacdn.com/gn_img/albums/koMWQ4B3qL/oMWQnv6Abq/size_l_1517031806.webp",
    SongName: "Gazab Ka Hai Din",
    Album: "Dil Juunglee",
    Audio:
        "https://pagalfree.com/musics/128-Gazab%20Ka%20Hai%20Din%20-%20Dil%20Juunglee%20128%20Kbps.mp3",
  ),
  ArtistPlayList(
    id: 3,
    SongimageUrl:
        "https://a10.gaanacdn.com/gn_img/albums/10q3Z1K52r/0q3ZPnA2b5/size_l_1560505187.webp",
    SongName: "Tujhe Kitna Chahein Aur",
    Album: "Kabir Singh",
    Audio:
        "https://pagalfree.com/musics/128-Tujhe%20Kitna%20Chahein%20Aur%20(Film%20Version)%20-%20Kabir%20Singh%20128%20Kbps.mp3",
  ),
  ArtistPlayList(
    id: 4,
    SongimageUrl:
        "https://a10.gaanacdn.com/gn_img/song/9En3peWXDV/n3pNQ276bX/size_m_1573026994.webp",
    SongName: "Kinna Sona",
    Album: "Marjaavaan",
    Audio:
        "https://pagalfree.com/musics/128-Kinna%20Sona%20-%20Marjaavaan%20128%20Kbps.mp3",
  ),
  ArtistPlayList(
    id: 5,
    SongimageUrl:
        "https://a10.gaanacdn.com/gn_img/albums/9En3pqeWXD/En3p6mAPbX/size_l_1537469414.webp",
    SongName: "Tum Se",
    Album: "Jalebi",
    Audio:
        "https://pagalfree.com/musics/128-Tum%20Se%20-%20Jalebi%20128%20Kbps.mp3",
  )
];
final List<ArtistPlayList> TonyKakkarPlaylist = [
  ArtistPlayList(
    id: 1,
    SongimageUrl:
        "https://a10.gaanacdn.com/gn_img/albums/P7m3GNKqxo/7m3G4xd6Wq/size_l_1713371901.webp",
    SongName: "Dheeme Dheeme",
    Album: "Pati Patni Aur Woh",
    Audio:
        "https://pagalfree.com/musics/128-Dheeme%20Dheeme%20-%20Pati%20Patni%20Aur%20Woh%20128%20Kbps.mp3",
  ),
  ArtistPlayList(
    id: 2,
    SongimageUrl:
        "https://a10.gaanacdn.com/gn_img/albums/9En3peWXDV/n3pqgje6WX/size_l.webp",
    SongName: "Saath Kya Nibhaoge",
    Album: "Saath Kya Nibhaoge",
    Audio:
        "https://pagalfree.com/musics/128-Saath%20Kya%20Nibhaoge%20-%20Tony%20Kakkar%20128%20Kbps.mp3",
  ),
  ArtistPlayList(
    id: 3,
    SongimageUrl:
        "https://a10.gaanacdn.com/gn_img/albums/jBr3gybR1m/r3gLPxnQWR/size_l.jpg",
    SongName: "Mud Mud Ke",
    Album: "Mud Mud Ke",
    Audio:
        "https://pagalfree.com/musics/128-Mud%20Mud%20Ke%20-%20Tony%20Kakkar%20128%20Kbps.mp3",
  ),
  ArtistPlayList(
    id: 4,
    SongimageUrl:
        "https://a10.gaanacdn.com/gn_img/albums/7rVW1aRWk5/VW1aEGejWk/size_l.webp",
    SongName: "Oh Sanam",
    Album: "Oh Sanam",
    Audio:
        "https://pagalfree.com/musics/128-Oh%20Sanam%20-%20Tony%20Kakkar%20128%20Kbps.mp3",
  ),
  ArtistPlayList(
    id: 5,
    SongimageUrl:
        "https://a10.gaanacdn.com/gn_img/albums/4Z9bqgo3yQ/Z9bq8Z0MWy/size_l_1551078199.webp",
    SongName: "Coca Cola",
    Album: "Luka Chuppi",
    Audio:
        "https://pagalfree.com/musics/128-Coca%20Cola%20-%20Luka%20Chuppi%20128%20Kbps.mp3",
  )
];
final List<ArtistPlayList> TanishkBagchiPlaylist = [
  ArtistPlayList(
    id: 1,
    SongimageUrl:
        "https://a10.gaanacdn.com/gn_img/albums/R7vKX6WmrP/vKXrjXlzWm/size_l.jpg",
    SongName: "Teri Baaton Mein",
    Album: "Teri Baaton Mein",
    Audio:
        "https://pagalfree.com/musics/128-Teri%20Baaton%20Mein%20Aisa%20Uljha%20Jiya%20Title%20Song%20-%20Teri%20Baaton%20Mein%20Aisa%20Uljha%20Jiya%20128%20Kbps.mp3",
  ),
  ArtistPlayList(
    id: 2,
    SongimageUrl:
        "https://a10.gaanacdn.com/gn_img/albums/JD2KJyAbOL/D2KJML6ObO/size_l.webp",
    SongName: "Mere Rashke Qamar",
    Album: "Mere Rashke Qamar",
    Audio:
        "https://pagalfree.com/musics/128-Mere%20Rashke%20Qamar-%20Baadshaho%20128%20Kbps.mp3",
  ),
  ArtistPlayList(
    id: 3,
    SongimageUrl:
        "https://a10.gaanacdn.com/gn_img/albums/Rz4W8evbxD/4W87xyq93x/size_l.jpg",
    SongName: "Agar Ho Tum",
    Album: "Mr. And Mrs. Mahi",
    Audio:
        "https://pagalfree.com/musics/128-Agar%20Ho%20Tum%20-%20Mr.%20And%20Mrs.%20Mahi%20128%20Kbps.mp3",
  ),
  ArtistPlayList(
    id: 4,
    SongimageUrl:
        "https://pagalfree.com/images/128Laal%20Peeli%20Akhiyaan%20-%20Teri%20Baaton%20Mein%20Aisa%20Uljha%20Jiya%20128%20Kbps.jpg",
    SongName: "Laal Peeli Akhiyaan",
    Album: "Teri Baaton Mein",
    Audio:
        "https://pagalfree.com/musics/128-Laal%20Peeli%20Akhiyaan%20-%20Teri%20Baaton%20Mein%20Aisa%20Uljha%20Jiya%20128%20Kbps.mp3",
  ),
  ArtistPlayList(
    id: 5,
    SongimageUrl:
        "https://a10.gaanacdn.com/gn_img/albums/d41WjznWPL/41Wj2qgNWP/size_l.webp",
    SongName: "Naach Meri Rani",
    Album: "Naach Meri Rani",
    Audio:
        "https://pagalfree.com/musics/128-Naach%20Meri%20Rani%20-%20Guru%20Randhawa%20128%20Kbps.mp3",
  )
];
