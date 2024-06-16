import 'dart:ui';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:own_music/controller/ArtistsController.dart';
import 'package:own_music/modal/ArtistsModal.dart';
import 'package:own_music/view/Pages/SongPlayPages/SingleSongPlayPage.dart';

class ArtistDetailPage extends StatefulWidget {
  final String imageUrl;
  final String name;

  const ArtistDetailPage({
    required this.imageUrl,
    required this.name,
    super.key,
  });

  @override
  State<ArtistDetailPage> createState() => _ArtistDetailPageState();
}

class _ArtistDetailPageState extends State<ArtistDetailPage> {
  int? currentPlayingIndex;
  final player = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();
    player.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    player.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });

    player.onPlayerComplete.listen((_) {
      setState(() {
        currentPlayingIndex = null;
        position = Duration.zero;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    player.dispose();
  }

  List<ArtistPlayList> getPlaylist(String artistName) {
    // Define your playlists here
    return playlists[artistName] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    final playlist = getPlaylist(widget.name);

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(widget.name),
        backgroundColor: Color(0xff004aad),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff004aad).withOpacity(0.15),
                        Color(0xff004aad).withOpacity(0.05),
                      ],
                      begin: Alignment.topCenter,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(widget.imageUrl),
                          maxRadius: 80,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30, left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.name,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "${playlist.length} Tracks",
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontSize: 13,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Playlist created by Own Music",
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: playlist.isNotEmpty
                    ? ListView.builder(
                        itemCount: playlist.length,
                        itemBuilder: (context, index) {
                          final song = playlist[index];
                          final isPlaying = currentPlayingIndex == index;
                          return Container(
                            height: 74,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xff004aad).withOpacity(0.05),
                                  Color(0xff004aad).withOpacity(0.15),
                                ],
                                begin: Alignment.topCenter,
                              ),
                            ),
                            child: ListTile(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SingleSongPlayPage(
                                      song: song,
                                      position: position,
                                      duration: duration,
                                      player: player,
                                      playlist: playlist,
                                      initialSongIndex:
                                          index, // Pass the player instance
                                    ),
                                  ),
                                );
                              },
                              leading: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Center(
                                    child: Text(
                                      '${index + 1}',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  SizedBox(width: 14),
                                  CircleAvatar(
                                    maxRadius: 25,
                                    backgroundImage:
                                        NetworkImage(song.SongimageUrl),
                                  ),
                                ],
                              ),
                              title: Text(song.SongName),
                              subtitle: Text(song.Album),
                              trailing: IconButton(
                                onPressed: () async {
                                  if (isPlaying) {
                                    await player.pause();
                                    setState(() {
                                      currentPlayingIndex = null;
                                    });
                                  } else {
                                    await player.play(UrlSource(song.Audio));
                                    setState(() {
                                      currentPlayingIndex = index;
                                    });
                                  }
                                },
                                icon: Icon(
                                  isPlaying
                                      ? Icons.pause_circle_outline
                                      : Icons.play_circle_outline,
                                  size: 35,
                                  color: Color(0xff004aad),
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    : Center(
                        child: Text(
                          'Playlist not found',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
              ),
            ],
          ),
          if (currentPlayingIndex != null)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SingleSongPlayPage(
                        song: playlist[currentPlayingIndex!],
                        position: position,
                        duration: duration,
                        player: player,
                        playlist: playlist,
                        initialSongIndex:
                            currentPlayingIndex!, // Pass the player instance
                      ),
                    ),
                  );
                 // Navigator.pop(context);
                },
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
                    child: Container(
                      height: 150,
                      color: Color(0xff004aad).withOpacity(0.2),
                      child: Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              maxRadius: 30,
                              backgroundImage: NetworkImage(
                                  playlist[currentPlayingIndex!].SongimageUrl),
                            ),
                            title: Text(
                              playlist[currentPlayingIndex!].SongName,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              playlist[currentPlayingIndex!].Album,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            trailing: IconButton(
                              onPressed: () async {
                                if (currentPlayingIndex != null) {
                                  await player.pause();
                                  setState(() {
                                    currentPlayingIndex = null;
                                  });
                                } else {
                                  await player.play(UrlSource(
                                      playlist[currentPlayingIndex!].Audio));
                                  setState(() {
                                    currentPlayingIndex = currentPlayingIndex;
                                  });
                                }
                              },
                              icon: Icon(
                                currentPlayingIndex != null
                                    ? Icons.pause_circle_outline
                                    : Icons.play_circle_outline,
                                size: 35,
                                color: Color(0xff004aad),
                              ),
                            ),
                          ),
                          Slider(
                            thumbColor: Color(0xff004aad),
                            activeColor: Color(0xff004aad),
                            min: 0,
                            max: duration.inSeconds.toDouble() > 0
                                ? duration.inSeconds.toDouble()
                                : 1,
                            value: position.inSeconds
                                .toDouble()
                                .clamp(0, duration.inSeconds.toDouble()),
                            onChanged: (value) async {
                              final newPosition =
                                  Duration(seconds: value.toInt());
                              await player.seek(newPosition);
                              await player.resume();
                              if (duration == position) {
                                setState(() {
                                  currentPlayingIndex = null;
                                });
                              }
                            },
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(formatDuration(position)),
                                Text(formatDuration(duration)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }
}
