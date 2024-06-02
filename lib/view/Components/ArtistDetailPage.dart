import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:own_music/controller/ArtistsController.dart';

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
  bool isPlaying = false;
  final player = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();
    // Listen to audio duration
    player.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    // Listen to audio position changed
    player.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });

    // Check if the song is ended
    player.onPlayerComplete.listen((_) {
      setState(() {
        isPlaying = false;
        position = Duration.zero;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(widget.name),
        backgroundColor: Color(0xff004aad),
      ),
      body: Column(
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
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "10 Tracks",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
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
            child: ListView.builder(
              itemCount: ArijitSinghPlaylist.length,
              itemBuilder: (context, index) {
                final song = ArijitSinghPlaylist[index];
                return Container(
                  height: isPlaying ? 150 : 74,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff004aad).withOpacity(0.05),
                        Color(0xff004aad).withOpacity(0.15),
                      ],
                      begin: Alignment.topCenter,
                    ),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          maxRadius: 25,
                          backgroundImage: NetworkImage(song.SongimageUrl),
                        ),
                        title: Text(song.SongName),
                        subtitle: Text(song.Album),
                        trailing: IconButton(
                          onPressed: () async {
                            if (isPlaying) {
                              await player.pause();
                            } else {
                              await player.play(UrlSource(song.Audio));
                            }
                            setState(() {
                              isPlaying = !isPlaying;
                            });
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
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Visibility(
                          visible: isPlaying,
                          child: Column(
                            children: [
                              Slider(
                                thumbColor: Color(0xff004aad),
                                activeColor: Color(0xff004aad),
                                min: 0,
                                max: duration.inSeconds.toDouble() > 0
                                    ? duration.inSeconds.toDouble()
                                    : 1,
                                value: position.inSeconds.toDouble().clamp(
                                    0, duration.inSeconds.toDouble()),
                                onChanged: (value) async {
                                  final newPosition =
                                  Duration(seconds: value.toInt());
                                  await player.seek(newPosition);
                                  await player.resume();
                                  if (duration == position) {
                                    setState(() {
                                      isPlaying = false;
                                    });
                                  }
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
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
                    ],
                  ),
                );
              },
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
