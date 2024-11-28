import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:own_music/modal/ArtistsModal.dart';
import 'package:own_music/view/Components/ArtistsPage.dart';
import 'package:own_music/view/Pages/SongPlayPages/SingleSongPlayPage.dart';
import 'package:own_music/view/Components/CarouselSlider.dart';

import '../../controller/ArtistsController.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<ArtistPlayList>> songsFuture;
  late AudioPlayer audioPlayer;
  late ArtistsController artistsController;
  List<bool> isPlayingList = []; // List to track play/pause state of each song

  ScrollController scrollController = ScrollController();
  bool showExpandIcon = false;

  @override
  void initState() {
    super.initState();
    artistsController = ArtistsController();
    songsFuture = artistsController.getAllSongs();
    audioPlayer = AudioPlayer();

    // Initialize isPlayingList with false for each song
    songsFuture.then((songs) {
      setState(() {
        isPlayingList = List.filled(songs.length, false, growable: false);
      });
    });

    // Add a listener to the scroll controller
    scrollController.addListener(() {
      // Calculate a threshold value for detecting if the user is at the end
      double threshold = 50.0;
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent - threshold &&
          !scrollController.position.outOfRange) {
        if (!showExpandIcon) {
          setState(() {
            showExpandIcon = true;
          });
        }
      } else {
        if (showExpandIcon) {
          setState(() {
            showExpandIcon = false;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff004aad),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8, top: 10, bottom: 8),
                    child: Text(
                      "Top Picks",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 206,
                color: const Color(0xff004aad),
                child: CarouselSliderPage(),
              ),
              Container(
                height: 200,
                child: const ArtistsPage(),
              ),
              const SizedBox(height: 30),
              const Row(
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
              // Songs List
              FutureBuilder<List<ArtistPlayList>>(
                future: songsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.data == null || snapshot.data!.isEmpty) {
                    return const Text('No songs found');
                  } else {
                    return SizedBox(
                      height: 250,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        controller: scrollController,
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
                                borderRadius: const BorderRadius.all(
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
                                    color: const Color(0xff004aad),
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
              // Show expand icon only if showExpandIcon is true
              showExpandIcon
                  ? Center(
                      child: IconButton(
                        onPressed: () {
                          scrollController.animateTo(
                            scrollController.position.minScrollExtent,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.linear,
                          );
                        },
                        icon: const Icon(
                          Icons.arrow_circle_up_outlined,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    )
                  : Center(
                      child: IconButton(
                        onPressed: () {
                          scrollController.animateTo(
                            scrollController.position.maxScrollExtent,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.linear,
                          );
                        },
                        icon: const Icon(
                          Icons.arrow_circle_down_outlined,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
