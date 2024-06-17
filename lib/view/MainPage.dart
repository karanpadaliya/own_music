import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:own_music/view/Pages/AudioPage.dart';
import 'package:own_music/view/Pages/CategoryPage.dart';
import 'package:own_music/view/Pages/FavouritePage.dart';
import 'package:own_music/view/Pages/HomePage.dart';
import 'package:own_music/view/Pages/ProfilePage.dart';
import 'package:own_music/view/Pages/VideoPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController = TabController(length: 5, vsync: this);

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff004aad),
        body: Column(
          children: [
            // Blurred AppBar
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        Color(0xff004aad).withOpacity(0.5),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: AppBar(
                    toolbarHeight: 60,
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    leading: Image.asset(
                      "assets/images/Logo_png.png",
                    ),
                    leadingWidth: 70,
                    actions: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.search_outlined,
                              size: 26,
                            ),
                          ),
                          Stack(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.notifications_active_outlined,
                                  size: 26,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 24,top: 5),
                                child: CircleAvatar(
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                  maxRadius: 10,
                                  child: Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: Text(
                                      "1+",
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
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
                ),
              ),
            ),
            // TabBarView
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  HomePage(),
                  AudioPage(),
                  VideoPage(),
                  FavouritePage(),
                  ProfilePage(),
                ],
              ),
            ),
          ],
        ),
        // Bottom Navigation Bar
        bottomNavigationBar: Container(
          color: Color(0xfff4f4f4),
          child: TabBar(
            controller: tabController,
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.label,
            unselectedLabelColor: Colors.grey,
            isScrollable: true,
            physics: BouncingScrollPhysics(),
            tabAlignment: TabAlignment.start,
            tabs: [
              Tab(text: 'Home'),
              Tab(text: 'Audio'),
              Tab(text: 'Video'),
              Tab(text: 'Favourite'),
              Tab(text: 'Profile'),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MainPage(),
  ));
}
