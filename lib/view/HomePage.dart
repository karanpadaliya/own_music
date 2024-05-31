import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 80,
          leadingWidth: 100,
          leading: Image.asset("assets/images/Logo_png.png", scale: 3.5),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_active_outlined,
                size: 26,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: CircleAvatar(
                backgroundColor: Color(0xff004aad),
                child: Icon(
                  CupertinoIcons.person,
                  color: Colors.white,
                ),
              ),
            ),
          ],
          automaticallyImplyLeading: false,
        ),
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
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15,top: 15),
                    child: Text(
                      "Hello!!",
                      style: TextStyle(
                        fontSize: 18,
                        // fontFamily: "LXG",
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
                        hintText: "What do you want to listen today ?",
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
          ],
        ),
      ),
    );
  }
}
