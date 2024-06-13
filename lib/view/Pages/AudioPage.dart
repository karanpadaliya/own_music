import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:own_music/controller/ArtistsController.dart';
import 'package:own_music/view/Components/ArtistDetailPage.dart';

class AudioPage extends StatefulWidget {
  const AudioPage({super.key});

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff004aad),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 5, right: 8, bottom: 10),
              child: Text(
                "Audio For You",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(8),
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                  childAspectRatio: 0.75,
                ),
                itemCount: artists.length,
                itemBuilder: (context, index) {
                  final artist = artists[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ArtistDetailPage(
                            imageUrl: artist.imageUrl,
                            name: artist.name,
                          ),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(artist.imageUrl),
                          maxRadius: 50,
                        ),
                        SizedBox(height: 5),
                        Text(
                          artist.name,
                          style: TextStyle(
                            color: Colors.white,
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
      ),
    );
  }
}
