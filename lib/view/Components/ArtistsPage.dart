import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              child: InkWell(
                onTap: () {
                  print("Click on Artists =========>>>>>");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Artists(
                      "https://a10.gaanacdn.com/gn_img/artists/Dk9KNk23Bx/k9KNqJJbBx/size_m_1716815348.webp",
                      "Arijit Singh",
                    ),
                    Artists(
                      "https://a10.gaanacdn.com/gn_img/artists/zLp36PvbrG/Lp36AR0KrG/size_m_1716815534.webp",
                      "Pritam",
                    ),
                    Artists(
                      "https://a10.gaanacdn.com/gn_img/artists/9MAWe7KyJe/MAWe9lBGWy/size_m_1716892787.webp",
                      "Badshah",
                    ),
                    Artists(
                      "https://a10.gaanacdn.com/gn_img/artists/Rz4W87v3xD/Rz4W8ppWxD/size_m_1716893509.webp",
                      "Neha Kakkar",
                    ),
                    Artists(
                      "https://a10.gaanacdn.com/gn_img/artists/6Zxb2r7b9w/Zxb2xp0w39/size_m.jpg",
                      "B Praak",
                    ),
                    Artists(
                      "https://a10.gaanacdn.com/gn_img/artists/10q3ZR1352/0q3Z6Lg135/size_m_1716892887.webp",
                      "Jubin Nautiyal",
                    ),
                    Artists(
                      "https://a10.gaanacdn.com/gn_img/artists/Dk9KNk23Bx/k9KNgP763B/size_m_1595857138.webp",
                      "Tony Kakkar",
                    ),
                    Artists(
                      "https://a10.gaanacdn.com/gn_img/artists/w4MKPDOKoj/4MKPgoQgbo/size_m_1516802409.webp",
                      "Yo Yo Honey Singh",
                    ),
                    Artists(
                      "https://a10.gaanacdn.com/gn_img/artists/21GWwrR3pk/1GWwYz4DKp/size_m_1567610470.webp",
                      "Tanishk Bagchi",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row Artists(String Imagelink, String ArtistsName) {
    return Row(
      children: [
        SizedBox(
          width: 8,
        ),
        Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(Imagelink),
              maxRadius: 50,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              ArtistsName,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 8,
        ),
      ],
    );
  }
}
