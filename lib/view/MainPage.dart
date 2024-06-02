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
  late TabController tabController = TabController(length: 6, vsync: this);

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
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  HomePage(),
                  AudioPage(),
                  VideoPage(),
                  CategoryPage(),
                  FavouritePage(),
                  ProfilePage(),
                ],
              ),
            ),
          ],
        ),
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
            // indicator: BoxDecoration(
            //   // color: Colors.black,
            //   shape: BoxShape.circle,
            // ),
            tabs: [
              Tab(text: 'Home'),
              Tab(text: 'Audio'),
              Tab(text: 'Video'),
              Tab(text: 'Category'),
              Tab(text: 'Favourite'),
              Tab(text: 'Profile'),
            ],
          ),
        ),
      ),
    );
  }
}
