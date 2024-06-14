import 'dart:ui';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:own_music/modal/ArtistsModal.dart';

class SingleSongPlayPage extends StatefulWidget {
  final List<ArtistPlayList> playlist;
  final int initialSongIndex;
  final AudioPlayer player;
  final Duration duration;
  late Duration position;

  SingleSongPlayPage({
    required this.playlist,
    required this.initialSongIndex,
    required this.player,
    required this.duration,
    required this.position,
    required ArtistPlayList song,
  });

  @override
  _SingleSongPlayPageState createState() => _SingleSongPlayPageState();
}

class _SingleSongPlayPageState extends State<SingleSongPlayPage> {
  late int currentSongIndex;
  late ArtistPlayList currentSong;

  @override
  void initState() {
    super.initState();
    currentSongIndex = widget.initialSongIndex;
    currentSong = widget.playlist[currentSongIndex];
    playCurrentSong();

    // Update position when player's position changes
    widget.player.onPositionChanged.listen((Duration newPosition) {
      setState(() {
        widget.position = newPosition;
      });
    });

    // Play next song when current song ends
    widget.player.onPlayerComplete.listen((event) {
      playNextSong();
    });
  }

  Future<void> playCurrentSong() async {
    await widget.player.play(UrlSource(currentSong.Audio));
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
      currentSongIndex = (currentSongIndex - 1) % widget.playlist.length;
      if (currentSongIndex < 0) {
        currentSongIndex = widget.playlist.length - 1;
      }
      currentSong = widget.playlist[currentSongIndex];
    });
    playCurrentSong();
  }

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
          Image.network(currentSong.SongimageUrl),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150, left: 10),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: CircleAvatar(
                maxRadius: 150,
                backgroundImage: NetworkImage(currentSong.SongimageUrl),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 180),
              child: Text(
                currentSong.SongName,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 240),
              child: Text(
                "Album: ${currentSong.Album}",
                style: TextStyle(
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
                      Text(formatDuration(widget.position)),
                      Text(formatDuration(widget.duration)),
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
                  max: widget.duration.inSeconds.toDouble() > 0
                      ? widget.duration.inSeconds.toDouble()
                      : 1,
                  value: widget.position.inSeconds
                      .toDouble()
                      .clamp(0, widget.duration.inSeconds.toDouble()),
                  onChanged: (value) async {
                    final newPosition = Duration(seconds: value.toInt());
                    await widget.player.seek(newPosition);
                    if (widget.player.state == PlayerState.playing) {
                      await widget.player.resume();
                    }
                    setState(() {
                      widget.position = newPosition;
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
                IconButton(
                  onPressed: playPreviousSong,
                  icon: Icon(
                    Icons.skip_previous,
                    size: 40,
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
                  ),
                ),
                IconButton(
                  onPressed: playNextSong,
                  icon: Icon(
                    Icons.skip_next,
                    size: 40,
                  ),
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

  @override
  void dispose() {
    widget.player.dispose();
    super.dispose();
  }
}
