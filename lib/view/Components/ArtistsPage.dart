import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:own_music/controller/ArtistsController.dart';
import 'package:own_music/view/Components/ArtistDetailPage.dart';

class ArtistsPage extends StatefulWidget {
  const ArtistsPage({super.key});

  @override
  State<ArtistsPage> createState() => _ArtistsPageState();
}

class _ArtistsPageState extends State<ArtistsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff004aad),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 8, top: 35, right: 8, bottom: 10),
              child: Text(
                "Artists For You",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: artists.map((index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ArtistDetailPage(
                            imageUrl: index.imageUrl,
                            name: index.name,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 7),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(index.imageUrl),
                            maxRadius: 50,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            index.name,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
