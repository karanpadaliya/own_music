import 'package:flutter/material.dart';
import 'package:own_music/view/Components/CarouselSlider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff004aad),
        body: Column(
          children: [
            Container(
              height: 185,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 15),
                    child: Text(
                      "Hello!!",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "Karan Padaliya",
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: "LXG",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25, right: 25, bottom: 5, top: 24),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText:
                        "What do you want to listen today ?",
                        labelStyle: TextStyle(
                          fontSize: 15,
                        ),
                        suffixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: 206,
              color: Color(0xff004aad),
              child: CarouselSliderPage(),
            ),


          //   Category
            Text("data"),
          ],
        ),
      ),
    );
  }
}
