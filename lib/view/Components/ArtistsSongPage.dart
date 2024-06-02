import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArtistsSongPage extends StatefulWidget {
  final String imageUrl;
  final String ArtistsName;

  ArtistsSongPage(
      {required this.imageUrl, required this.ArtistsName, super.key});

  @override
  State<ArtistsSongPage> createState() => _ArtistsSongPageState();
}

class _ArtistsSongPageState extends State<ArtistsSongPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Text("_ArtistsSongPageState"),
      ),
    );
  }
}
