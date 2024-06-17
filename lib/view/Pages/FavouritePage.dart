import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:own_music/controller/ArtistsController.dart';
import 'package:own_music/modal/ArtistsModal.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:own_music/view/Pages/SongPlayPages/SingleSongPlayPage.dart';

class FavouritePage extends StatefulWidget {
  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  AudioPlayer player = AudioPlayer(); // Create an instance of AudioPlayer

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff004aad),
      body: favoriteSongs.isNotEmpty
          ? ListView.builder(
              itemCount: favoriteSongs.length,
              itemBuilder: (context, index) {
                final song = favoriteSongs[index];
                return Padding(
                  padding: EdgeInsets.only(top: 10, left: 8, right: 8),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(song.SongimageUrl),
                        ),
                        title: Text(song.SongName),
                        subtitle: Text(song.Album),
                        trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              favoriteSongs.remove(song);
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    '${song.SongName} removed from favorites'),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.remove_circle,
                            color: Colors.red,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SingleSongPlayPage(
                                playlist: favoriteSongs,
                                initialSongIndex: index,
                                player: player,
                                song: song,
                                position: Duration.zero,
                                duration: Duration.zero,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/no_favourite_found.png",
                    scale: 0.9,
                  ),
                  Text(
                    "No favorites yet",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
