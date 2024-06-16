import 'dart:ui';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:own_music/modal/ArtistsModal.dart';

class SingleSongPlayPage extends StatefulWidget {
  final List<ArtistPlayList> playlist;
  final int initialSongIndex;
  final AudioPlayer player;

  SingleSongPlayPage({
    required this.playlist,
    required this.initialSongIndex,
    required this.player,
    required ArtistPlayList song,
    required Duration position,
    required Duration duration,
  });

  @override
  _SingleSongPlayPageState createState() => _SingleSongPlayPageState();
}

class _SingleSongPlayPageState extends State<SingleSongPlayPage> {
  late int currentSongIndex;
  late ArtistPlayList currentSong;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();
    currentSongIndex = widget.initialSongIndex;
    currentSong = widget.playlist[currentSongIndex];
    playCurrentSong();

    widget.player.onPlayerStateChanged.listen((state) {
      if (state == PlayerState.completed) {
        playNextSong();
      }
    });

    widget.player.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    widget.player.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  Future<void> playCurrentSong() async {
    await widget.player.play(UrlSource(currentSong.Audio));
    final newDuration = await widget.player.getDuration();
    final newPosition = await widget.player.getCurrentPosition();
    setState(() {
      duration = newDuration ?? Duration.zero;
      position = newPosition ?? Duration.zero;
    });
  }

  void playNextSong() {
    setState(() {
      currentSongIndex = (currentSongIndex + 1) % widget.playlist.length;
      currentSong = widget.playlist[currentSongIndex];
    });
    playCurrentSong();
  }

  void playPreviousSong() {
    setState(() {
      currentSongIndex = (currentSongIndex - 1 + widget.playlist.length) %
          widget.playlist.length;
      currentSong = widget.playlist[currentSongIndex];
    });
    playCurrentSong();
  }

  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentSong.SongName),
        backgroundColor: Color(0xff004aad),
        foregroundColor: Colors.white,
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.network(
              currentSong.SongimageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 130, left: 10),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Container(
                child: Stack(
                  children: [
                    // Image
                    Image.asset(
                      "assets/images/musicBackground.gif",
                      color: Colors.white,
                    ),
                    // CircleAvatar with padding
                    Padding(
                      padding: const EdgeInsets.only(top: 73, left: 73),
                      child: CircleAvatar(
                        maxRadius: 120,
                        backgroundImage: NetworkImage(currentSong.SongimageUrl),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 200),
              child: Text(
                currentSong.SongName,
                style: TextStyle(
                  shadows: [
                    Shadow(
                      offset: Offset(2.0, 2.0),
                      blurRadius: 10.0,
                      color: Colors.black,
                    ),
                  ],
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 260),
              child: Text(
                "Album: ${currentSong.Album}",
                style: TextStyle(
                  shadows: [
                    Shadow(
                      offset: Offset(2.0, 2.0),
                      blurRadius: 5.0,
                      color: Colors.black,
                    ),
                  ],
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          Stack(
            children: [
              Positioned(
                bottom: 135,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        formatDuration(position),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        formatDuration(duration),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 150,
                left: 0,
                right: 0,
                child: Slider(
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
                    final newPosition = Duration(seconds: value.toInt());
                    await widget.player.seek(newPosition);
                    if (widget.player.state == PlayerState.playing) {
                      await widget.player.resume();
                    }
                    setState(() {
                      position = newPosition;
                    });
                  },
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shuffle,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: playPreviousSong,
                  icon: Icon(
                    Icons.skip_previous,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    if (widget.player.state == PlayerState.playing) {
                      await widget.player.pause();
                    } else {
                      await widget.player.resume();
                    }
                    setState(() {});
                  },
                  icon: Icon(
                    widget.player.state == PlayerState.playing
                        ? Icons.pause_circle_outline
                        : Icons.play_circle_outline,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: playNextSong,
                  icon: Icon(
                    Icons.skip_next,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    isFavorite = !isFavorite;
                    setState(() {});
                  },
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    size: 30,
                    color: isFavorite ? Colors.red : Colors.white,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
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
