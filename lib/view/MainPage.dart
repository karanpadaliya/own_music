import 'dart:ui';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:own_music/controller/artistsController.dart';
import 'package:own_music/modal/ArtistsModal.dart';
import 'package:own_music/view/Pages/AudioPage.dart';
import 'package:own_music/view/Pages/FavouritePage.dart';
import 'package:own_music/view/Pages/HomePage.dart';
import 'package:own_music/view/Pages/ProfilePage.dart';
import 'package:own_music/view/Pages/SongPlayPages/SingleSongPlayPage.dart';
import 'package:own_music/view/Pages/VideoPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late ArtistsController artistsController;
  late Future<List<ArtistPlayList>> songsFuture;
  List<bool> isPlayingList = []; // List to track play/pause state of each song
  late AudioPlayer audioPlayer;
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;
  List<ArtistPlayList> searchResults = [];
  int currentlyPlayingIndex =
      -1; // Index of the currently playing song, -1 means no song is playing

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
    artistsController = ArtistsController(); // Initialize the controller
    songsFuture = artistsController.getAllSongs();
    audioPlayer = AudioPlayer();

    // Initialize isPlayingList with false for each song
    songsFuture.then((songs) {
      setState(() {
        isPlayingList = List.filled(songs.length, false, growable: false);
      });
    });
  }

  void searchSongs(String query) async {
    List<ArtistPlayList> allSongs = await artistsController.getAllSongs();
    List<ArtistPlayList> results = [];

    if (query.isNotEmpty) {
      for (var element in allSongs) {
        for (var song in element.getPlayList()) {
          if (song.SongName.toLowerCase().contains(query.toLowerCase())) {
            results.add(element); // Add the whole playlist if any song matches
            break; // Exit the inner loop once a match is found in the playlist
          }
        }
      }
    }

    setState(() {
      searchResults = results;
      isSearching = query.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff004aad),
        body: Column(
          children: [
            // Blurred AppBar
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        Color(0xff004aad).withOpacity(0.5),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: AppBar(
                    toolbarHeight: 60,
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    leading: Image.asset(
                      "assets/images/Logo_png.png",
                    ),
                    leadingWidth: 70,
                    title: isSearching
                        ? TextField(
                            maxLength: 10,
                            controller: searchController,
                            decoration: InputDecoration(
                              hintText: 'Search',
                              border: InputBorder.none,
                              counterText: '',
                            ),
                            onChanged: searchSongs,
                          )
                        : null,
                    actions: [
                      isSearching
                          ? IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: () {
                                setState(() {
                                  searchController.clear();
                                  searchResults.clear();
                                  isSearching = false;
                                });
                              },
                            )
                          : IconButton(
                              onPressed: () {
                                setState(() {
                                  isSearching = true;
                                });
                              },
                              icon: Icon(
                                Icons.search_outlined,
                                size: 26,
                              ),
                            ),
                      IconButton(
                        onPressed: () {},
                        icon: Stack(
                          children: [
                            Icon(
                              Icons.notifications_active_outlined,
                              size: 26,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 12),
                              child: CircleAvatar(
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                maxRadius: 7,
                                child: Text(
                                  "1+",
                                  style: TextStyle(fontSize: 9,fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            tabController.index = 4; // Select Profile tab
                          });
                        },
                        icon: CircleAvatar(
                          backgroundColor: Color(0xff004aad),
                          child: Icon(
                            CupertinoIcons.person,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                    automaticallyImplyLeading: false,
                  ),
                ),
              ),
            ),
            // TabBarView or Search Results
            Expanded(
              child: isSearching
                  ? searchResults.isEmpty
                      ? Center(
                          child: Text(
                            'Let\'s search your favorite song',
                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.white,
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: searchResults.length,
                          itemBuilder: (context, index) {
                            final artistPlaylist = searchResults[index];
                            final playlist = artistPlaylist.getPlayList();
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  artistPlaylist.SongName,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                playlist.isNotEmpty
                                    ? Column(
                                        children: playlist.map((song) {
                                          int songIndex =
                                              playlist.indexOf(song);
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
                                                    Colors.white
                                                        .withOpacity(0.8),
                                                    Colors.white
                                                        .withOpacity(0.4),
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
                                                      builder: (context) =>
                                                          SingleSongPlayPage(
                                                        song: song,
                                                        playlist: playlist,
                                                        initialSongIndex:
                                                            songIndex,
                                                        player: audioPlayer,
                                                        position: Duration.zero,
                                                        duration: Duration.zero,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                leading: CircleAvatar(
                                                  maxRadius: 25,
                                                  backgroundImage: NetworkImage(
                                                      song.SongimageUrl),
                                                ),
                                                title: Text(song.SongName),
                                                subtitle: Text(song.Album),
                                                trailing: IconButton(
                                                  onPressed: () async {
                                                    // Handle playing/pausing the song
                                                    if (currentlyPlayingIndex ==
                                                            index &&
                                                        isPlayingList[
                                                            songIndex]) {
                                                      await audioPlayer.pause();
                                                      setState(() {
                                                        currentlyPlayingIndex =
                                                            -1; // No song is playing
                                                      });
                                                    } else {
                                                      await audioPlayer.play(
                                                          UrlSource(
                                                              song.Audio));
                                                      setState(() {
                                                        currentlyPlayingIndex =
                                                            index; // Update the index of the currently playing song
                                                      });
                                                    }
                                                    setState(() {
                                                      isPlayingList[songIndex] =
                                                          !isPlayingList[
                                                              songIndex]; // Toggle the playing state
                                                    });
                                                  },
                                                  icon: Icon(
                                                    currentlyPlayingIndex ==
                                                                index &&
                                                            isPlayingList[
                                                                songIndex]
                                                        ? Icons
                                                            .pause_circle_outline
                                                        : Icons
                                                            .play_circle_outline,
                                                    size: 35,
                                                    color: Color(0xff004aad),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      )
                                    : Center(
                                        child: Text(
                                          'Song not found',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                Divider(),
                              ],
                            );
                          },
                        )
                  : TabBarView(
                      controller: tabController,
                      children: [
                        HomePage(),
                        AudioPage(),
                        VideoPage(),
                        FavouritePage(),
                        ProfilePage(),
                      ],
                    ),
            ),
          ],
        ),
        // Bottom Navigation Bar
        bottomNavigationBar: Container(
          color: Color(0xfff4f4f4),
          child: TabBar(
            controller: tabController,
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.label,
            unselectedLabelColor: Colors.grey,
            isScrollable: true,
            physics: BouncingScrollPhysics(),
            tabAlignment: TabAlignment.start,
            tabs: [
              Tab(text: 'Home'),
              Tab(text: 'Audio'),
              Tab(text: 'Video'),
              Tab(text: 'Favourite'),
              Tab(text: 'Profile'),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Navigator(
        pages: [
          MaterialPage(child: MainPage()),
        ],
        onPopPage: (route, result) {
          // Prevent navigating back from closing the app
          if (!route.didPop(result)) {
            return false;
          }
          // Navigate to the home page if there are no pages left in the stack
          if (route.settings.name == null) {
            return true;
          }
          return false;
        },
      ),
    );
  }
}
