import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:own_music/controller/ArtistsController.dart';
import 'package:own_music/modal/ArtistsModal.dart';
import 'package:own_music/view/Components/ArtistDetailPage.dart';
import 'package:own_music/view/Pages/SongPlayPages/SingleSongPlayPage.dart';

class AudioPage extends StatefulWidget {
  const AudioPage({super.key});

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  late Future<List<ArtistPlayList>> songsFuture;
  List<bool> isPlayingList = [];
  AudioPlayer audioPlayer = AudioPlayer();


  @override
  void initState() {
    songsFuture = artistsController.getAllSongs();
    // Initialize isPlayingList with false for each song
    songsFuture.then((songs) {
      setState(() {
        isPlayingList = List.filled(songs.length, false, growable: false);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff004aad),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Audio For You",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 150,
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            // Songs List
            FutureBuilder<List<ArtistPlayList>>(
              future: songsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.data == null || snapshot.data!.isEmpty) {
                  return Text('No songs found');
                } else {
                  return Expanded(
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      // controller: scrollController,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final song = snapshot.data![index];
                        return Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 7,
                            right: 7,
                          ),
                          child: Container(
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white.withOpacity(0.8),
                                  Colors.white.withOpacity(0.4),
                                ],
                                begin: Alignment.topCenter,
                              ),
                            ),
                            child: ListTile(
                              onTap: () {
                                // Handle tapping on the song
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SingleSongPlayPage(
                                      song: song,
                                      playlist: snapshot.data!,
                                      initialSongIndex: index,
                                      player: audioPlayer,
                                      position: Duration.zero,
                                      duration: Duration.zero,
                                    ),
                                  ),
                                );
                              },
                              leading: CircleAvatar(
                                maxRadius: 25,
                                backgroundImage:
                                    NetworkImage(song.SongimageUrl),
                              ),
                              title: Text(song.SongName),
                              subtitle: Text(song.Album),
                              trailing: IconButton(
                                onPressed: () async {
                                  // Handle playing/pausing the song
                                  if (isPlayingList[index]) {
                                    await audioPlayer.pause();
                                  } else {
                                    await audioPlayer
                                        .play(UrlSource(song.Audio));
                                  }
                                  setState(() {
                                    isPlayingList[index] = !isPlayingList[
                                        index]; // Toggle the playing state
                                  });
                                },
                                icon: Icon(
                                  isPlayingList[index]
                                      ? Icons.pause_circle_outline
                                      : Icons.play_circle_outline,
                                  size: 35,
                                  color: Color(0xff004aad),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
