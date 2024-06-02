import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SongPage extends StatefulWidget {
  final String imageUrl;
  final String name;

  SongPage({super.key, required this.imageUrl, required this.name});

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text("${widget.name}"),
            Image.network(widget.imageUrl),
          ],
        ),
      ),
    );
  }
}
